//
//  KVICheckboxGroup.m
//  Booya Fitness
//
//  Created by Vasyl Khmil on 11/26/15.
//  Copyright © 2015 MEV. All rights reserved.
//

#import "KVICheckboxGroup.h"
#import "KVICheckbox.h"

@implementation KVICheckboxGroup

static NSMutableDictionary* groupPerIdentifier;

#pragma mark - Constants

static NSString* const SelectedKey = @"selected";

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

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark - Public

- (void)addCheckbox:(KVICheckbox *)checkbox {
    if (checkbox != nil) {
        
        NSMutableArray *mutableCheckboxes = (NSMutableArray *)self.checkboxes;
        
        if (![mutableCheckboxes containsObject:checkbox]) {
            [mutableCheckboxes addObject:checkbox];
            [[NSNotificationCenter defaultCenter] addObserver:self
                                                     selector:@selector(checkboxValueChanged:)
                                                         name:KVICheckboxStatusChangedNotification
                                                       object:checkbox];
        }
    }
}

- (void)removeCheckbox:(KVICheckbox *)checkbox {
    if (checkbox != nil) {
        
        NSMutableArray *mutableCheckboxes = (NSMutableArray *)self.checkboxes;
        
        if ([mutableCheckboxes containsObject:checkbox]) {
            [mutableCheckboxes removeObject:checkbox];
            
            [[NSNotificationCenter defaultCenter] removeObserver:self
                                                            name:KVICheckboxStatusChangedNotification
                                                          object:checkbox];
        }
    }
}

#pragma mark - Observation

- (void)checkboxValueChanged:(NSNotification *)notification {
    KVICheckbox *changedCheckbox = notification.object;
    
    if ([self.checkboxes containsObject:changedCheckbox] &&
        changedCheckbox.selected) {
        
        
        for (KVICheckbox *checkbox in self.checkboxes) {
            if (checkbox != changedCheckbox) {
                checkbox.selected = FALSE;
            }
        }
    }
}

@end
