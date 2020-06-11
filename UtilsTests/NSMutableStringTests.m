//
//  NSMutableStringTests.m
//  Utils
//
//  Created by Gleb Tarasov on 15.03.14.
//  Copyright (c) 2014 CT Consulting. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NSMutableString+CUUtils.h"

@interface NSMutableStringTests : XCTestCase

@end

@implementation NSMutableStringTests

- (void)testReplaceOccurrencesOfString {
    NSString *test = @"abcdaasdsafgggg";
    NSMutableString *str = test.mutableCopy;
    
    [str replaceOccurrencesOfString:@"gggg" withString:@"gg"];
    XCTAssertEqualObjects(str, @"abcdaasdsafgg");
    
    [str replaceOccurrencesOfString:@"gggg" withString:@"gg"];
    XCTAssertEqualObjects(str, @"abcdaasdsafgg");
    
    [str replaceOccurrencesOfString:@"abcdaasds" withString:@"a"];
    XCTAssertEqualObjects(str, @"aafgg");
}

@end
