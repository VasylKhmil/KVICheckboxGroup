//
//  KVICheckboxGroup.h
//  Booya Fitness
//
//  Created by Vasyl Khmil on 11/26/15.
//  Copyright © 2015 MEV. All rights reserved.
//

#import <Foundation/Foundation.h>

@class KVICheckbox;

@interface KVICheckboxGroup : NSObject

@property (nonatomic, readonly) NSArray<KVICheckbox*> *checkboxes;


+ (nonnull instancetype)groupWithIdentifier:(nonnull NSString *)groupIdentifier;

- (void)addCheckbox:(nonnull KVICheckbox *)checkbox;

- (void)removeCheckbox:(nonnull KVICheckbox *)checkbox;

@end
