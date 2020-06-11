//
//  NSDateComponents+HandyMethods.h
//  NewCalendar
//
//  Created by Гасанов Михаил on 01.06.14.
//  Copyright (c) 2014 CTConsulting. All rights reserved.
//

@interface NSDateComponents (CUUtils)

- (NSDate *)dateTime;

- (instancetype)componentsByAddingDays:(NSInteger)days;
- (instancetype)componentsByAddingHours:(NSInteger)hours;
- (instancetype)componentsByAddingMinutes:(NSInteger)minutes;
- (instancetype)componentsByAddingHours:(NSInteger)hours minutes:(NSInteger)minutes;
- (instancetype)componentsByAddingDays:(NSInteger)days hours:(NSInteger)hours minutes:(NSInteger)minutes;

- (instancetype)componentsBySettingDays:(NSInteger)days;

@end
