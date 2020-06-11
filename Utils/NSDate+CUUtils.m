//
//  NSDate+Utils.m
//  AldoCoppola
//
//  Created by Глеб Тарасов on 05.07.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "NSDate+CUUtils.h"

static NSCalendar *gmtCalendar = nil;
static NSDateFormatter *__dayFormatter = nil;
static NSDateFormatter *__dateFormatter = nil;
static NSUInteger const kSaturdayWeekday = 7;
static NSUInteger const kSundayWeekday = 1;

@implementation NSDate (CUUtils)

- (NSCalendar *)gmtCalendar {
    if (!gmtCalendar) {
        gmtCalendar = [[NSCalendar currentCalendar] copy];
        gmtCalendar.timeZone = [NSTimeZone timeZoneWithName:@"GMT"];
    }
    return gmtCalendar;
}

- (NSDate *)gmt_dateWithoutTime {
    
    NSDateComponents *comps = [self.gmtCalendar components:(NSYearCalendarUnit
                                                                        |NSMonthCalendarUnit
                                                                        |NSDayCalendarUnit)
                                                              fromDate:self];
    return [self.gmtCalendar dateFromComponents:comps];
}

- (NSDate *)gmt_firstDayOfYear {
    NSDateComponents *comps = [self.gmtCalendar components:(NSYearCalendarUnit)
                                                  fromDate:self];
    comps.month = 1;
    comps.day = 1;
    
    return [self.gmtCalendar dateFromComponents:comps];
}

- (NSDate *)gmt_firstDayOfQuarter {
    
    NSDateComponents *comps = [self.gmtCalendar components:NSYearCalendarUnit fromDate:self];
    
    static NSDateFormatter *__formatter = nil;
    if (!__formatter) {
        __formatter = [[NSDateFormatter alloc] init];
        __formatter.timeZone = self.gmtCalendar.timeZone;
        [__formatter setDateFormat:@"Q"];
    }
    
    // возможно баг у Apple: квартал не вычитывается из NSDateComponents
    // http://stackoverflow.com/questions/11618784/i-want-to-get-a-quarter-value-in-nsdatecomponents-class
    int quarter = [[__formatter stringFromDate:self] intValue];
    
    comps.month = (quarter - 1) * 3 + 1;
    comps.day = 1;

    return [self.gmtCalendar dateFromComponents:comps];
}

- (NSDate *)gmt_firstDayOfMonth {
    NSDateComponents *comps = [self.gmtCalendar components:(NSYearCalendarUnit
                                                                        |NSMonthCalendarUnit)
                                                              fromDate:self];
    comps.day = 1;
    return [self.gmtCalendar dateFromComponents:comps];
}

- (NSDate *)gmt_firstDayOfWeek {
    NSDateComponents *comps = [self.gmtCalendar components:(NSYearCalendarUnit
                                                                        |NSMonthCalendarUnit
                                                                        |NSWeekOfYearCalendarUnit
                                                                        |NSWeekdayCalendarUnit
                                                                        |NSYearForWeekOfYearCalendarUnit)
                                                              fromDate:self];

    comps.weekday = [self.gmtCalendar firstWeekday];
    return [self.gmtCalendar dateFromComponents:comps];
}

#pragma mark - Class Methods

+ (instancetype)today {
    return [[self date] dayDate];
}

#pragma mark - Instance Methods

- (NSDateComponents *)fullComponents {
    return [[NSCalendar currentCalendar] components:NSYearCalendarUnit | NSMonthCalendarUnit | NSWeekdayCalendarUnit |
            NSDayCalendarUnit | NSHourCalendarUnit | NSMinuteCalendarUnit fromDate:self];
}

- (NSDateComponents *)dayComponents {
    return [[NSCalendar currentCalendar] components:NSYearCalendarUnit | NSMonthCalendarUnit | NSWeekdayCalendarUnit | NSDayCalendarUnit fromDate:self];
}

- (NSDateComponents *)timeComponents {
    return [[NSCalendar currentCalendar] components:NSHourCalendarUnit | NSMinuteCalendarUnit fromDate:self];
}

+ (NSDateFormatter *)dayFormatter {
    if (!__dayFormatter) {
        __dayFormatter = [[NSDateFormatter alloc] init];
        __dayFormatter.dateStyle = NSDateFormatterLongStyle;
        __dayFormatter.timeStyle = NSDateFormatterNoStyle;
        __dayFormatter.timeZone = [NSTimeZone timeZoneForSecondsFromGMT:0]; // чтобы даты выводились корректно вне зависимости от часового пояса
        __dayFormatter.locale = [[NSLocale alloc] initWithLocaleIdentifier:[[NSLocale preferredLanguages] firstObject]];
    }
    
    return __dayFormatter;
}

+ (NSDateFormatter *)dateTimeFormatter {
    if (!__dateFormatter) {
        __dateFormatter = [[NSDateFormatter alloc] init];
        __dateFormatter.dateStyle = NSDateFormatterLongStyle;
        __dateFormatter.timeStyle = NSDateFormatterShortStyle;
        __dateFormatter.locale = [[NSLocale alloc] initWithLocaleIdentifier:[[NSLocale preferredLanguages] firstObject]];
    }

    return __dateFormatter;
}

- (NSString *)dayString {
    return [self.class.dayFormatter stringFromDate:self];
}

- (NSString *)dateTimeString {
    return [self.class.dateTimeFormatter stringFromDate:self];
}

+ (NSDate *)dateFromDayString:(NSString *)str {
    return [self.dayFormatter dateFromString:str];
}

+ (NSDate *)dateFromDateTimeString:(NSString *)str {
    return [self.dateTimeFormatter dateFromString:str];
}

- (NSDate *)dayDate {
    return [[NSCalendar currentCalendar] dateFromComponents:[self dayComponents]];
}

- (NSDate *)timeDate {
    return [[NSCalendar currentCalendar] dateFromComponents:[self timeComponents]];
}

- (NSInteger)daysToDate:(NSDate *)date {
    NSDate *fromDate;
    NSDate *toDate;
    [[NSCalendar currentCalendar] rangeOfUnit:NSDayCalendarUnit startDate:&fromDate interval:nil forDate:self];
    [[NSCalendar currentCalendar] rangeOfUnit:NSDayCalendarUnit startDate:&toDate interval:nil forDate:date];
    
    return [[NSCalendar currentCalendar] components:NSDayCalendarUnit fromDate:fromDate toDate:toDate options:0].day;
}

- (BOOL)isWeekend {
    NSInteger weekday = [self dayComponents].weekday;
    return weekday == kSaturdayWeekday || weekday == kSundayWeekday;
}

- (NSDate *)nextDay {
    NSDateComponents *dateComponents = [self dayComponents];
    dateComponents.day ++;
    return [[NSCalendar currentCalendar] dateFromComponents:dateComponents];
}

- (NSDate *)previousDay {
    NSDateComponents *dateComponents = [self dayComponents];
    dateComponents.day --;
    return [[NSCalendar currentCalendar] dateFromComponents:dateComponents];
}

- (NSDate *)firstDayOfNextMonth {
	NSCalendar *calendar = [NSCalendar currentCalendar];
	NSInteger lastDay = [calendar rangeOfUnit:NSDayCalendarUnit inUnit:NSMonthCalendarUnit forDate:self].length;
	NSDateComponents *components = [self fullComponents];
	components.day = lastDay + 1;
	return [calendar dateFromComponents:components];
}

- (NSDate *)lastDayOfPreviousMonth {
	NSDateComponents *components = [self fullComponents];
	components.day = 0;
	return [[NSCalendar currentCalendar] dateFromComponents:components];
}

- (instancetype)dateByAddingDays:(NSInteger)days {
    return [[[self fullComponents] componentsByAddingDays:days] dateTime];
}

- (instancetype)dateByAddingHours:(NSInteger)hours {
    return [[[self fullComponents] componentsByAddingHours:hours] dateTime];
}

- (instancetype)dateByAddingMinutes:(NSInteger)minutes {
    return [[[self fullComponents] componentsByAddingMinutes:minutes] dateTime];
}

- (instancetype)dateByAddingHours:(NSInteger)hours minutes:(NSInteger)minutes {
    return [[[self fullComponents] componentsByAddingHours:hours minutes:minutes] dateTime];
}

- (instancetype)dateByAddingDays:(NSInteger)days hours:(NSInteger)hours minutes:(NSInteger)minutes {
    return [[[self fullComponents] componentsByAddingDays:days hours:hours minutes:minutes] dateTime];
}


- (instancetype)dateBySettingDays:(NSInteger)days {
    return [[[self fullComponents] componentsBySettingDays:days] dateTime];
}

@end

