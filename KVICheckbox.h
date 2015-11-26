//
//  KVICheckbox.h
//  Booya Fitness
//
//  Created by Vasyl Khmil on 11/26/15.
//  Copyright © 2015 MEV. All rights reserved.
//

#import <UIKit/UIKit.h>

extern NSString* KVICheckboxStatusChangedNotification;

@interface KVICheckbox : UIImageView

@property (nonatomic)           IBInspectable BOOL selected;
@property (nonatomic, strong)   IBInspectable NSString *groupIdentifier;

@property (nonatomic, strong) UIImage *checkedImage;
@property (nonatomic, strong) UIImage *uncheckedImage;

@end
