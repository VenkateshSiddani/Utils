//
//  NSArrayTests.m
//  Utils
//
//  Created by Gleb Tarasov on 13.03.14.
//  Copyright (c) 2014 CT Consulting. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NSArray+CUUtils.h"

@interface TestObj : NSObject

- (id)initWithObjNum:(NSNumber *)objNum intNum:(NSInteger)intNum str:(NSString *)str;

@property (strong, nonatomic) NSNumber *objNum;
@property (nonatomic) NSInteger intNum;
@property (strong, nonatomic) NSString *str;

@end

@implementation TestObj

- (id)initWithObjNum:(NSNumber *)objNum intNum:(NSInteger)intNum str:(NSString *)str {
    self = [super init];
    if (self) {
        self.objNum = objNum;
        self.intNum = intNum;
        self.str = str;
    }
    return self;
}

@end

@interface NSArrayTests : XCTestCase

@property (strong, nonatomic) NSArray *numArray;
@property (strong, nonatomic) NSArray *strArray;
@property (strong, nonatomic) NSArray *emptyArray;

@end

@implementation NSArrayTests

- (void)setUp {
    self.numArray = @[@2, @1, @3, @4];
    self.strArray = @[ @"str4", @"str2", @"str1", @"str3" ];
    self.emptyArray = @[];
}

- (void)testRandomObject {
    XCTAssertNil(self.emptyArray.randomObject);
    
    NSInteger num = [self.numArray.randomObject integerValue];
    XCTAssertTrue(num == 1 || num == 2 || num == 3 || num == 4);
    
    NSString *str = self.strArray.randomObject;
    XCTAssertTrue([self.strArray containsObject:str]);
}

- (void)testSortedArrayAlphabetically {
    NSArray *arr = @[ @"арус", @"aeng", @"123", @"б", @"b"];
    NSArray *sorted;
    
    // в зависимости от языка - разный порядок для русских букв, это нормально
    NSString *language = [[NSLocale preferredLanguages] objectAtIndex:0];
    if ([language isEqualToString:@"ru"]) {
        sorted = @[ @"123", @"арус", @"б", @"aeng", @"b" ];
    }
    else {
        sorted = @[ @"123", @"aeng", @"b", @"арус", @"б" ];
    }
    
    XCTAssertEqualObjects([arr sortedArrayAlphabetically], sorted);
    XCTAssertEqualObjects([sorted sortedArrayAlphabetically], sorted);
}

- (void)testSortedArrayByKey {
    TestObj *t1 = [[TestObj alloc] initWithObjNum:@3 intNum:2 str:@"ccc"];
    TestObj *t2 = [[TestObj alloc] initWithObjNum:@2 intNum:3 str:@"aaa"];
    TestObj *t3 = [[TestObj alloc] initWithObjNum:@1 intNum:1 str:@"bbb"];
    
    NSArray *arr = @[ t1, t2, t3];
    
    NSArray *sortedByObjNum = @[ t3, t2, t1 ];
    NSArray *sortedByIntNum = @[ t3, t1, t2 ];
    NSArray *sortedByStr = @[ t2, t3, t1 ];

    XCTAssertEqualObjects([arr sortedArrayByKey:@selector(objNum)], sortedByObjNum);
    XCTAssertEqualObjects([arr sortedArrayByKey:@selector(intNum)], sortedByIntNum);
    XCTAssertEqualObjects([arr sortedArrayByKey:@selector(str)], sortedByStr);
}

- (void)testArrayByRemovingObject {
    XCTAssertEqualObjects([@[] arrayByRemovingObject:@5], @[]);
    
    XCTAssertEqualObjects([self.numArray arrayByRemovingObject:@5], self.numArray);
    XCTAssertEqualObjects([self.numArray arrayByRemovingObject:nil], self.numArray);
    XCTAssertEqualObjects([self.numArray arrayByRemovingObject:@1], (@[ @2, @3, @4 ]));
    XCTAssertEqualObjects([self.numArray arrayByRemovingObject:@2], (@[ @1, @3, @4 ]));
    XCTAssertEqualObjects([self.numArray arrayByRemovingObject:@4], (@[ @2, @1, @3 ]));
}

- (void)testShuffled {
    XCTAssertEqualObjects(@[].shuffled, @[]);
    
    XCTAssertEqualObjects([self.strArray.shuffled sortedArrayAlphabetically],
                          [self.strArray sortedArrayAlphabetically]);
}

- (void)testReversed {
    XCTAssertEqualObjects(@[].reversed, @[]);
    XCTAssertEqualObjects([(@[@1, @2, @3]) reversed], (@[@3, @2, @1]));
    XCTAssertEqualObjects([(@[@1, @3, @2]) reversed], (@[@2, @3, @1]));
}

@end
