//
//  KVICheckboxGroup.h
//  Booya Fitness
//
//  Created by Vasyl Khmil on 11/26/15.
//  Copyright © 2015 MEV. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KVICheckboxGroupProtocol.h"

@interface KVICheckboxGroup : NSObject <KVICheckboxGroup>

+ (instancetype)groupWithIdentifier:(NSString *)groupIdentifier;

@end
