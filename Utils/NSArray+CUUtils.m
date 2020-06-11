//
//  NSArray+CUUtils.m
//  Utils
//
//  Created by Gleb Tarasov on 13.03.14.
//  Copyright (c) 2014 CT Consulting. All rights reserved.
//

#import <BlocksKit/BlocksKit.h>
#import "NSArray+CUUtils.h"

@implementation NSArray (CUUtils)

- (id)randomObject {
    if (self.count == 0)
        return nil;
    
    NSInteger index = arc4random() % self.count;
    return self[index];
}

- (NSArray *)arrayByRemovingObject:(id)object {
    NSMutableArray *copy = self.mutableCopy;
    [copy removeObject:object];
    return copy;
}

- (NSArray *)shuffled {
	NSMutableArray *tmpArray = [NSMutableArray arrayWithCapacity:[self count]];
    
	for (id anObject in self) {
		NSUInteger randomPos = arc4random()%([tmpArray count]+1);
		[tmpArray insertObject:anObject atIndex:randomPos];
	}
    
	return [NSArray arrayWithArray:tmpArray];
}

- (NSArray *)reversed {
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:[self count]];
    NSEnumerator *enumerator = [self reverseObjectEnumerator];
    for (id element in enumerator) {
        [array addObject:element];
    }
    return array;
}

- (NSArray *)sortedArrayByKey:(SEL)keySelector {
    NSString *key = NSStringFromSelector(keySelector);
    NSSortDescriptor *s = [[NSSortDescriptor alloc] initWithKey:key ascending:YES];
    return [self sortedArrayUsingDescriptors:@[s]];
}

- (NSArray *)sortedArrayAlphabetically {
    return [self sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
}

- (NSArray *)distinct {
    return [[NSSet setWithArray:self] allObjects];
}

- (NSArray *)arrayByRejectingNulls {
    return [self bk_reject:^BOOL(id obj) {
        return obj == [NSNull null];
    }];
}

- (NSArray *)bk_mapAndRejectNulls:(id (^)(id obj))block {
    return [[self bk_map:block] arrayByRejectingNulls];
}

@end
