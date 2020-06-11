//
//  NSStringTests.m
//  Utils
//
//  Created by Gleb Tarasov on 15.03.14.
//  Copyright (c) 2014 CT Consulting. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NSString+CUUtils.h"

@interface NSStringTests : XCTestCase

@end

@implementation NSStringTests

- (void)testContainsString {
    XCTAssertTrue([@"123321123" containsString:@"123"]);
    XCTAssertTrue([@"123321123" containsString:@"3211"]);
    XCTAssertTrue([@"123321123" containsString:@"1"]);
    XCTAssertFalse([@"123321123" containsString:@"4"]);
    XCTAssertFalse([@"123321123" containsString:@"12333"]);
    XCTAssertFalse([@"" containsString:@"1"]);
    XCTAssertFalse([@"" containsString:@""]);
    XCTAssertFalse([@"123" containsString:@""]);
}

- (void)testStartsWith {
    XCTAssertTrue([@"123" startsWith:@"1"]);
    XCTAssertTrue([@"123" startsWith:@"12"]);
    XCTAssertTrue([@"123" startsWith:@"123"]);
    XCTAssertFalse([@"123" startsWith:@"2"]);
    XCTAssertFalse([@"123" startsWith:@"23"]);
    XCTAssertFalse([@"123" startsWith:@"4"]);
    XCTAssertFalse([@"" startsWith:@"4"]);
    XCTAssertFalse([@"123" startsWith:@""]);
}

- (void)testEndsWith {
    XCTAssertTrue([@"123" endsWith:@"3"]);
    XCTAssertTrue([@"123" endsWith:@"23"]);
    XCTAssertTrue([@"123" endsWith:@"123"]);
    XCTAssertFalse([@"123" endsWith:@"2"]);
    XCTAssertFalse([@"123" endsWith:@"12"]);
    XCTAssertFalse([@"123" endsWith:@"4"]);
    XCTAssertFalse([@"" endsWith:@"4"]);
    XCTAssertFalse([@"123" endsWith:@""]);
}

- (void)testStringByTrimming {
    XCTAssertEqualObjects([@"123" stringByTrimming], @"123");
    XCTAssertEqualObjects([@" 123" stringByTrimming], @"123");
    XCTAssertEqualObjects([@" 123     " stringByTrimming], @"123");
    XCTAssertEqualObjects([@" 123  \r\n   " stringByTrimming], @"123");
    
    XCTAssertEqualObjects([@"\r\r123\n" stringByTrimming], @"123");
    XCTAssertEqualObjects([@"\r\r123\t" stringByTrimming], @"123");
    XCTAssertEqualObjects([@"" stringByTrimming], @"");
}

- (void)testFullRange {
    XCTAssertTrue(NSEqualRanges(@"123".fullRange, NSMakeRange(0, 3)));
    XCTAssertTrue(NSEqualRanges(@"1234".fullRange, NSMakeRange(0, 4)));
    XCTAssertTrue(NSEqualRanges(@"".fullRange, NSMakeRange(0, 0)));
    XCTAssertTrue(NSEqualRanges(@"123\r\n123".fullRange, NSMakeRange(0, 8)));
}

- (void)testHeightWithFont {
    CGFloat height = [@"1" heightWithFont:[UIFont systemFontOfSize:17] constrainedToWidth:1000];
    CGFloat height2 = [@"1\n1" heightWithFont:[UIFont systemFontOfSize:17] constrainedToWidth:1000];
    CGFloat height3 = [@"1\n1\n123123" heightWithFont:[UIFont systemFontOfSize:17] constrainedToWidth:1000];
    CGFloat height4 = [@"123 123" heightWithFont:[UIFont systemFontOfSize:17] constrainedToWidth:50];
    XCTAssertTrue(height > 17);
    XCTAssertEqual(height * 2, height2);
    XCTAssertEqual(height * 3, height3);
    XCTAssertEqual(height * 2, height4);
}

- (void)testDecodingUnicode {
    NSString *str = @"Can't update objects: (\
    \" fields: '(\\n    ParentId\\n)', message: '\\U0420\\U043e\\U0434\\U0438\\U0442\\U0435\\U043b\\U044c\\U0441\\U043a\\U0430\\U044f \\U043e\\U0440\\U0433\\U0430\\U043d\\U0438\\U0437\\U0430\\U0446\\U0438\\U044f \\U043d\\U0435 \\U043c\\U043e\\U0436\\U0435\\U0442 \\U0431\\U044b\\U0442\\U044c \\U043f\\U043e\\U0442\\U043e\\U043c\\U043a\\U043e\\U043c \\U0434\\U043e\\U0447\\U0435\\U0440\\U043d\\U0435\\U0439 \\U043e\\U0440\\U0433\\U0430\\U043d\\U0438\\U0437\\U0430\\U0446\\U0438\\U0438.'";
    
    NSString *decoded = [str stringByDecodingUnicode];
    XCTAssert([decoded containsString:@"Родительская организация не может быть потомком дочерней организации."]);
}

@end
