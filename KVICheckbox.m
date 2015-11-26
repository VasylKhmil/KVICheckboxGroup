//
//  KVICheckbox.m
//  Booya Fitness
//
//  Created by Vasyl Khmil on 11/26/15.
//  Copyright © 2015 MEV. All rights reserved.
//

#import "KVICheckbox.h"
#import "KVICheckboxGroup.h"

NSString* KVICheckboxStatusChangedNotification = @"KVICheckboxStatusChangedNotification";


@interface KVICheckbox ()

@property (nonatomic) IBInspectable NSString *checkImage;
@property (nonatomic) IBInspectable NSString *uncheckImage;


@end


@implementation KVICheckbox

#pragma mark - Properties

- (void)setGroupIdentifier:(NSString *)groupIdentifier {
    
    if (_groupIdentifier != nil) {
        KVICheckboxGroup *oldGroup = [KVICheckboxGroup groupWithIdentifier:_groupIdentifier];
        [oldGroup removeCheckbox:self];
    }
    
    _groupIdentifier = groupIdentifier;
    
    KVICheckboxGroup *newGroup = [KVICheckboxGroup groupWithIdentifier:groupIdentifier];
    [newGroup addCheckbox:self];
}

- (void)setSelected:(BOOL)selected {
    _selected = selected;
    
    [[NSNotificationCenter defaultCenter] postNotificationName:KVICheckboxStatusChangedNotification
                                                        object:self];
    
    [self updateImage];

}

- (void)setCheckImage:(NSString *)checkImage {
    self.checkedImage = [UIImage imageNamed:checkImage];
}

- (void)setUncheckImage:(NSString *)uncheckImage {
    self.uncheckedImage = [UIImage imageNamed:uncheckImage];
}

#pragma mark - Lifecycle

- (void)awakeFromNib {
    [super awakeFromNib];
    
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                                 action:@selector(selfTapped)];
    self.userInteractionEnabled = TRUE;
    [self addGestureRecognizer:tapGesture];
}

- (void)willMoveToWindow:(UIWindow *)newWindow {
    [self updateImage];
}

#pragma mark - Actions

- (void)selfTapped {
    if (!self.selected) {
        self.selected = TRUE;
    }
}

#pragma mark - Private

- (void)updateImage {
    if (self.selected) {
        self.image = self.checkedImage;
        
    } else {
        self.image = self.uncheckedImage;
    }
}

@end
