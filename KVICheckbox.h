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

@property (nonatomic)                   IBInspectable BOOL selected;
@property (nonatomic, strong, nonnull)  IBInspectable NSString *groupIdentifier;

@property (nonatomic, weak, nullable) id<KVICheckboxDelegate> delegate;

@property (nonatomic, strong, nullable) UIImage *checkedImage;
@property (nonatomic, strong, nullable) UIImage *uncheckedImage;

@end
