//
//  KVICheckboxGroupProtocol.h
//  Booya Fitness
//
//  Created by Vasyl Khmil on 11/29/15.
//  Copyright © 2015 MEV. All rights reserved.
//

#import <Foundation/Foundation.h>

@class KVICheckbox;
@class KVICheckboxGroup;

@protocol KVICheckboxGroupDelegate <NSObject>

@optional
- (void)checkboxGroup:(nonnull KVICheckboxGroup *)checkboxGroup
    didSelectCheckbox:(nonnull KVICheckbox *)checkbox;

- (void)checkboxGroup:(nonnull KVICheckboxGroup *)checkboxGroup
  didDeselectCheckbox:(nonnull KVICheckbox *)checkbox;

@end



@protocol KVICheckboxGroup <NSObject>

@property (nonatomic) BOOL allowMultipleSelection;

@property (nonatomic, weak) id<KVICheckboxGroupDelegate> delegate;

@property (nonatomic, readonly, nullable) NSArray<__kindof KVICheckbox*> *checkboxes;
@property (nonatomic, readonly, nullable) NSArray<__kindof KVICheckbox *> *selectedCheckboxes;
@property (nonatomic, readonly, nullable) KVICheckbox *anySelectedCheckbox;


+ (nonnull id<KVICheckboxGroup>)groupWithIdentifier:(nonnull NSString *)groupIdentifier;


- (void)addCheckbox:(nonnull KVICheckbox *)checkbox;

- (void)removeCheckbox:(nonnull KVICheckbox *)checkbox;

@end
