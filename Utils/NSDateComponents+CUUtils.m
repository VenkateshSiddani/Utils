//
//  NSDateComponents+HandyMethods.m
//  NewCalendar
//
//  Created by Гасанов Михаил on 01.06.14.
//  Copyright (c) 2014 CTConsulting. All rights reserved.
//

#import "NSDateComponents+CUUtils.h"

@implementation NSDateComponents (CUUtils)

- (NSDate *)dateTime {
    return [[NSCalendar currentCalendar] dateFromComponents:self];
}

- (instancetype)componentsByAddingDays:(NSInteger)days {
    NSDateComponents *newComponents = [self copy];
    newComponents.day = (newComponents.day == NSDateComponentUndefined ? days : newComponents.day + days);
    return newComponents;
}

- (instancetype)componentsByAddingHours:(NSInteger)hours {
    NSDateComponents *newComponents = [self copy];
    newComponents.hour = (newComponents.hour == NSDateComponentUndefined ? hours : newComponents.hour + hours);
    return newComponents;
}

- (instancetype)componentsByAddingMinutes:(NSInteger)minutes {
    NSDateComponents *newComponents = [self copy];
    newComponents.minute  = (newComponents.minute == NSDateComponentUndefined ? minutes : newComponents.minute + minutes);
    return newComponents;
}

- (instancetype)componentsByAddingHours:(NSInteger)hours minutes:(NSInteger)minutes {
    return [[self componentsByAddingHours:hours] componentsByAddingMinutes:minutes];
}

- (instancetype)componentsByAddingDays:(NSInteger)days hours:(NSInteger)hours minutes:(NSInteger)minutes {
    return [[[self componentsByAddingDays:days] componentsByAddingHours:hours] componentsByAddingMinutes:minutes];
}


- (instancetype)componentsBySettingDays:(NSInteger)days {
    NSDateComponents *newComponents = [self copy];
    newComponents.day = days;
    return newComponents;
}

@end
