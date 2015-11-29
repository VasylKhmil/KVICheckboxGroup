//
//  KVICheckboxGroupProxy.m
//  Booya Fitness
//
//  Created by Vasyl Khmil on 11/29/15.
//  Copyright © 2015 MEV. All rights reserved.
//

#import "KVICheckboxGroupProxy.h"
#import "KVICheckboxGroup.h"

@interface KVICheckboxGroupProxy ()

@property (nonatomic, weak) IBOutlet id<KVICheckboxGroupDelegate> proxiedDelegate;

@property (nonatomic, strong) IBInspectable NSString *groupIdentifier;

@property (nonatomic, strong) id<KVICheckboxGroup> proxiedCheckboxGroup;

@end

@implementation KVICheckboxGroupProxy

#pragma mark - Properties

- (void)setGroupIdentifier:(NSString *)groupIdentifier {
    _groupIdentifier = groupIdentifier;
    
    self.proxiedCheckboxGroup = [KVICheckboxGroup groupWithIdentifier:groupIdentifier];
}

- (void)setProxiedDelegate:(id<KVICheckboxGroupDelegate>)proxiedDelegate {
    self.proxiedCheckboxGroup.delegate = proxiedDelegate;
}

#pragma mark - Message Forwarding

- (void)forwardInvocation:(NSInvocation *)anInvocation {
    if (self.proxiedCheckboxGroup != nil) {
        [anInvocation invokeWithTarget:self.proxiedCheckboxGroup];
        
    } else {
        [super forwardInvocation:anInvocation];
    }
}

@end
