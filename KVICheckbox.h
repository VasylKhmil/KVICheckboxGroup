//
//  KVICheckbox.h
//  Booya Fitness
//
//  Created by Vasyl Khmil on 11/26/15.
//  Copyright © 2015 MEV. All rights reserved.
//

#import <UIKit/UIKit.h>

@class KVICheckbox;

@protocol KVICheckboxDelegate <NSObject>

@optional
- (void)checkboxDidChangeState:(KVICheckbox *)checkbox;

- (BOOL)checkbox:(KVICheckbox *)checkbox shouldChangeStateToState:(BOOL)selected;

@end



@interface KVICheckbox : UIImageView

@property (nonatomic)           IBInspectable BOOL selected;
@property (nonatomic, strong)   IBInspectable NSString *groupIdentifier;

@property (nonatomic, weak) id<KVICheckboxDelegate> delegate;

@property (nonatomic, strong) UIImage *checkedImage;
@property (nonatomic, strong) UIImage *uncheckedImage;

@end
