//
//  NSObjectTests.m
//  Utils
//
//  Created by Gleb Tarasov on 26.06.14.
//  Copyright (c) 2014 CT Consulting. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NSObject+CUUtils.h"

@interface ObjectBase : NSObject

@end

@implementation ObjectBase

@end

@interface Object1 : ObjectBase

@end

@implementation Object1

@end

@interface Object2 : ObjectBase

@end

@implementation Object2

@end

@interface Object3 : Object2

@end

@implementation Object3

@end


@interface NSObjectTests : XCTestCase

@end

@implementation NSObjectTests


- (void)testFindChildObjects
{
    NSArray *objs = [ObjectBase findAllChildClasses];
    XCTAssertEqual(objs.count, 3);
    XCTAssertTrue([objs containsObject:Object1.class]);
    XCTAssertTrue([objs containsObject:Object2.class]);
    XCTAssertTrue([objs containsObject:Object3.class]);
    
    objs = [Object1 findAllChildClasses];
    XCTAssertEqual(objs.count, 0);
    
    objs = [Object2 findAllChildClasses];
    XCTAssertEqual(objs.count, 1);
    XCTAssertTrue([objs containsObject:Object3.class]);
    
    objs = [NSNumber findAllChildClasses];
    XCTAssertTrue(objs.count > 0);
}

@end
