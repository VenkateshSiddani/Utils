//
//  NSDateTests.m
//  Utils
//
//  Created by Gleb Tarasov on 13.03.14.
//  Copyright (c) 2014 CT Consulting. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NSDate+CUUtils.h"

@interface NSDateTests : XCTestCase

@end

@implementation NSDateTests

- (NSCalendar *)gmtCalendar {
    NSCalendar *cal = [[NSCalendar currentCalendar] copy];
    cal.timeZone = [NSTimeZone timeZoneWithName:@"GMT"];
    return cal;
}

- (void)testDateWithoutTime {
    NSDate *date = [NSDate.date gmt_dateWithoutTime];
    XCTAssertNotNil(date);
    

    NSCalendar *cal = [self gmtCalendar];
    NSDateComponents *comps = [cal components:(NSCalendarUnitYear
                                               | NSCalendarUnitMonth
                                               | NSCalendarUnitDay
                                               | NSCalendarUnitHour
                                               | NSCalendarUnitMinute
                                               | NSCalendarUnitSecond) fromDate:date];
    
    
    NSDateComponents *currentComps = [cal components:(NSCalendarUnitYear
                                               | NSCalendarUnitMonth
                                               | NSCalendarUnitDay
                                               | NSCalendarUnitHour
                                               | NSCalendarUnitMinute
                                               | NSCalendarUnitSecond) fromDate:NSDate.date];
    XCTAssertEqual(comps.year, currentComps.year);
    XCTAssertEqual(comps.month, currentComps.month);
    XCTAssertEqual(comps.day, currentComps.day);
    XCTAssertEqual(comps.hour, 0);
    XCTAssertEqual(comps.minute, 0);
    XCTAssertEqual(comps.second, 0);
}

- (void)testFirstDayOfMonth {
    NSDate *date = [NSDate.date gmt_firstDayOfMonth];
    XCTAssertNotNil(date);
    
    NSCalendar *cal = [self gmtCalendar];
    
    NSDateComponents *comps = [cal components:(NSCalendarUnitYear
                                               | NSCalendarUnitMonth
                                               | NSCalendarUnitDay
                                               | NSCalendarUnitHour
                                               | NSCalendarUnitMinute
                                               | NSCalendarUnitSecond) fromDate:date];
    
    
    NSDateComponents *currentComps = [cal components:(NSCalendarUnitYear
                                                      | NSCalendarUnitMonth
                                                      | NSCalendarUnitDay
                                                      | NSCalendarUnitHour
                                                      | NSCalendarUnitMinute
                                                      | NSCalendarUnitSecond) fromDate:NSDate.date];
    XCTAssertEqual(comps.year, currentComps.year);
    XCTAssertEqual(comps.month, currentComps.month);
    XCTAssertEqual(comps.day, 1);
    XCTAssertEqual(comps.hour, 0);
    XCTAssertEqual(comps.minute, 0);
    XCTAssertEqual(comps.second, 0);
}

- (void)testFirstDayOfWeek {

    // в en_US первый день воскресенье, из-за этого разные тестовые данные
    NSLocale *l = [NSLocale currentLocale];
    BOOL russianLocale = [l.localeIdentifier isEqualToString:@"ru_RU"];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = @"yyyy-MM-dd";
    dateFormatter.timeZone = [NSTimeZone timeZoneWithName:@"GMT"];
    NSDate *originalDate = [dateFormatter dateFromString:@"2014-05-17"];
    XCTAssertNotNil(originalDate);
    
    NSDate *date = [originalDate gmt_firstDayOfWeek];
    XCTAssertNotNil(date);
    NSString *str = [dateFormatter stringFromDate:date];
    XCTAssertEqualObjects(russianLocale ? @"2014-05-12" : @"2014-05-11", str);
    
    originalDate = [dateFormatter dateFromString:@"2014-05-18"];
    date = [originalDate gmt_firstDayOfWeek];
    str = [dateFormatter stringFromDate:date];
    XCTAssertEqualObjects(russianLocale ? @"2014-05-12" : @"2014-05-18", str);
    
    originalDate = [dateFormatter dateFromString:@"2014-05-12"];
    date = [originalDate gmt_firstDayOfWeek];
    str = [dateFormatter stringFromDate:date];
    XCTAssertEqualObjects(russianLocale ? @"2014-05-12" : @"2014-05-11", str);
    
    originalDate = [dateFormatter dateFromString:@"2014-05-13"];
    date = [originalDate gmt_firstDayOfWeek];
    str = [dateFormatter stringFromDate:date];
    XCTAssertEqualObjects(russianLocale ? @"2014-05-12" : @"2014-05-11", str);
    
    originalDate = [dateFormatter dateFromString:@"2014-05-11"];
    date = [originalDate gmt_firstDayOfWeek];
    str = [dateFormatter stringFromDate:date];
    XCTAssertEqualObjects(russianLocale ? @"2014-05-05" : @"2014-05-11", str);
}


- (void)testFirstDayOfQuarter {
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = @"yyyy-MM-dd";
    dateFormatter.timeZone = [NSTimeZone timeZoneWithName:@"GMT"];
    NSDate *originalDate = [dateFormatter dateFromString:@"2014-05-17"];
    XCTAssertNotNil(originalDate);
    
    NSDate *date = [originalDate gmt_firstDayOfQuarter];
    XCTAssertNotNil(date);
    NSString *str = [dateFormatter stringFromDate:date];
    XCTAssertEqualObjects(@"2014-04-01", str);
    
    originalDate = [dateFormatter dateFromString:@"2014-06-18"];
    date = [originalDate gmt_firstDayOfQuarter];
    str = [dateFormatter stringFromDate:date];
    XCTAssertEqualObjects(@"2014-04-01", str);
    
    originalDate = [dateFormatter dateFromString:@"2014-07-12"];
    date = [originalDate gmt_firstDayOfQuarter];
    str = [dateFormatter stringFromDate:date];
    XCTAssertEqualObjects(@"2014-07-01", str);
    
    originalDate = [dateFormatter dateFromString:@"2014-10-01"];
    date = [originalDate gmt_firstDayOfQuarter];
    str = [dateFormatter stringFromDate:date];
    XCTAssertEqualObjects(@"2014-10-01", str);
    
    originalDate = [dateFormatter dateFromString:@"2014-12-31"];
    date = [originalDate gmt_firstDayOfQuarter];
    str = [dateFormatter stringFromDate:date];
    XCTAssertEqualObjects(@"2014-10-01", str);
}

- (void)testFirstDayOfYear {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = @"yyyy-MM-dd";
    dateFormatter.timeZone = [NSTimeZone timeZoneWithName:@"GMT"];
    NSDate *originalDate = [dateFormatter dateFromString:@"2014-05-17"];
    XCTAssertNotNil(originalDate);
    
    NSDate *date = [originalDate gmt_firstDayOfYear];
    XCTAssertNotNil(date);
    NSString *str = [dateFormatter stringFromDate:date];
    XCTAssertEqualObjects(@"2014-01-01", str);
    
    originalDate = [dateFormatter dateFromString:@"2014-12-31"];
    date = [originalDate gmt_firstDayOfYear];
    str = [dateFormatter stringFromDate:date];
    XCTAssertEqualObjects(@"2014-01-01", str);
}

@end
