//
//  NSMutableArrayTests.m
//  Utils
//
//  Created by Gleb Tarasov on 15.03.14.
//  Copyright (c) 2014 CT Consulting. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NSMutableArray+CUUtils.h"

@interface NSMutableArrayTests : XCTestCase

@end

@implementation NSMutableArrayTests

- (void)testPopFirstObject {
    NSMutableArray *arr = @[ @1, @2, @3 ].mutableCopy;
    NSNumber *first = arr.popFirstObject;
    
    XCTAssertEqualObjects(arr, (@[ @2, @3]));
    XCTAssertEqualObjects(first, @1);
    
    first = arr.popFirstObject;
    XCTAssertEqualObjects(arr, (@[@3]));
    XCTAssertEqualObjects(first, @2);
    
    first = arr.popFirstObject;
    XCTAssertEqualObjects(arr, (@[]));
    XCTAssertEqualObjects(first, @3);
    
    first = arr.popFirstObject;
    XCTAssertEqualObjects(arr, (@[]));
    XCTAssertNil(first);
}

- (void)testPopObject {
    NSMutableArray *arr = @[ @1, @2, @3 ].mutableCopy;
    NSNumber *last = arr.popObject;
    
    XCTAssertEqualObjects(arr, (@[ @1, @2]));
    XCTAssertEqualObjects(last, @3);
    
    last = arr.popObject;
    XCTAssertEqualObjects(arr, (@[@1]));
    XCTAssertEqualObjects(last, @2);
    
    last = arr.popObject;
    XCTAssertEqualObjects(arr, (@[]));
    XCTAssertEqualObjects(last, @1);
    
    last = arr.popObject;
    XCTAssertEqualObjects(arr, (@[]));
    XCTAssertNil(last);
}

- (void)testPopRandomObject {
    NSArray *initialArr = @[ @1, @2, @3 ];
    NSMutableArray *arr = initialArr.mutableCopy;
    
    NSNumber *rand = arr.popRandomObject;
    XCTAssertTrue([initialArr containsObject:rand]);
    XCTAssertFalse([arr containsObject:rand]);
    XCTAssertEqual(arr.count, 2);
    
    rand = arr.popRandomObject;
    XCTAssertTrue([initialArr containsObject:rand]);
    XCTAssertFalse([arr containsObject:rand]);
    XCTAssertEqual(arr.count, 1);
    
    rand = arr.popRandomObject;
    XCTAssertTrue([initialArr containsObject:rand]);
    XCTAssertFalse([arr containsObject:rand]);
    XCTAssertEqual(arr.count, 0);
    
    rand = arr.popRandomObject;
    XCTAssertNil(rand);
    XCTAssertEqual(arr.count, 0);
}

@end
