//
//  NSSet+CUUtils.m
//  Utils
//
//  Created by User on 27.11.14.
//  Copyright (c) 2014 CT Consulting. All rights reserved.
//

#import "NSSet+CUUtils.h"

@implementation NSSet (CUUtils)

- (NSSet *)setByRemovingObject:(id)object {
    NSMutableSet *copy = self.mutableCopy;
    [copy removeObject:object];
    return copy;
}

@end
