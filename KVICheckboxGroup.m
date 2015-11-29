//
//  KVICheckboxGroup.m
//  Booya Fitness
//
//  Created by Vasyl Khmil on 11/26/15.
//  Copyright © 2015 MEV. All rights reserved.
//

#import "KVICheckboxGroup.h"
#import "KVICheckbox.h"

@interface KVICheckboxGroup () <KVICheckboxDelegate>

@property (nonatomic, strong) KVICheckbox *anySelectedCheckbox;

@end

@implementation KVICheckboxGroup
@synthesize
delegate                = _delegate,
allowMultipleSelection  = _allowMultipleSelection,
checkboxes              = _checkboxes;

static NSMutableDictionary* groupPerIdentifier;

#pragma mark - initialization

+ (instancetype)groupWithIdentifier:(NSString *)groupIdentifier {
    static dispatch_once_t initToken;
    
    dispatch_once(&initToken, ^{
        groupPerIdentifier = [NSMutableDictionary new];
    });
    
    KVICheckboxGroup *instance = groupPerIdentifier[groupIdentifier];
    
    if (instance == nil) {
        instance = [KVICheckboxGroup new];
        groupPerIdentifier[groupIdentifier] = instance;
    }
    
    return instance;
}

- (instancetype)init {
    self = [super init];
    
    if (self != nil) {
        _checkboxes = [NSMutableArray new];
    }
    
    return self;
}

#pragma mark - Properties

- (NSArray *)selectedCheckboxes {
    NSArray *result = [self.checkboxes filteredArrayUsingPredicate:[NSPredicate predicateWithBlock:^BOOL(KVICheckbox*  _Nonnull evaluatedObject, NSDictionary<NSString *,id> * _Nullable bindings) {
        return evaluatedObject.selected;
    }]];
    
    return result;
}

#pragma mark - Public

- (void)addCheckbox:(KVICheckbox *)checkbox {
    if (checkbox != nil) {
        
        NSMutableArray *mutableCheckboxes = (NSMutableArray *)self.checkboxes;
        
        if (![mutableCheckboxes containsObject:checkbox]) {
            [mutableCheckboxes addObject:checkbox];
            checkbox.delegate = self;
        }
    }
}

- (void)removeCheckbox:(KVICheckbox *)checkbox {
    if (checkbox != nil) {
        
        NSMutableArray *mutableCheckboxes = (NSMutableArray *)self.checkboxes;
        
        if ([mutableCheckboxes containsObject:checkbox]) {
            [mutableCheckboxes removeObject:checkbox];
            
            checkbox.delegate = nil;
        }
    }
}

#pragma mark - KVICheckboxDelegate

- (BOOL)checkbox:(KVICheckbox *)checkbox shouldChangeStateToState:(BOOL)selected {
    if (!selected           &&
        checkbox.selected   &&
        !self.allowMultipleSelection &&
        self.anySelectedCheckbox == checkbox) {
        
        return FALSE;
        
    } else {
        return TRUE;
    }
}

- (void)checkboxDidChangeState:(KVICheckbox *)checkbox {
    if (checkbox.selected) {
        
        self.anySelectedCheckbox = checkbox;
        
        if (!self.allowMultipleSelection) {
            [self deselectAllAcceptCheckbox:checkbox];
        }
        
        if ([self.delegate respondsToSelector:@selector(checkboxGroup:didSelectCheckbox:)]) {
            [self.delegate checkboxGroup:self didSelectCheckbox:checkbox];
        }
        
    } else {
        
        if ([self.delegate respondsToSelector:@selector(checkboxGroup:didDeselectCheckbox:)]) {
            [self.delegate checkboxGroup:self didDeselectCheckbox:checkbox];
        }
    }
}

- (void)deselectAllAcceptCheckbox:(KVICheckbox *)selectedCheckbox {
    if ([self.checkboxes containsObject:selectedCheckbox]) {
        
        
        for (KVICheckbox *checkbox in self.checkboxes) {
            if (checkbox != selectedCheckbox) {
                checkbox.selected = FALSE;
            }
        }
    }
}

@end
