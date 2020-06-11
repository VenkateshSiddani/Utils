//
//  NSDate+P34Utils.h
//  AldoCoppola
//
//  Created by Глеб Тарасов on 05.07.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSDateComponents+CUUtils.h"

#define TIME_INTERVAL_FOR_ONE_DAY 86400.

@interface NSDate (CUUtils)

/**
 *  Получает дату, копию текущей, но у которой часы, минуты и секунды равны нулю
 *
 *  @return дата без времени
 */
- (NSDate *)gmt_dateWithoutTime;

/**
 *  Получает дату, у которой год равен текущей, а день и месяц - первое января
 *
 *  @return первый день текущего года
 */
- (NSDate *)gmt_firstDayOfYear;

/**
 *  Получает дату, у которой год равен текущей, а день и месяц - первые в текущем квартале
 *
 *  @return первый день текущего квартала
 */
- (NSDate *)gmt_firstDayOfQuarter;

/**
 *  Получает дату, у которой год и месяц равны текущей, день равен первому числу, а время нулевое
 *
 *  @return первый день текущего месяца
 */
- (NSDate *)gmt_firstDayOfMonth;


/**
 *  Получает дату, у которой год и месяц равны текущей, день равен первому дню в текущей неделе
 *
 *  @return первый день текущей недели
 */
- (NSDate *)gmt_firstDayOfWeek;

#pragma mark -

+ (instancetype)today;                  // Возвращает дату c сегодняшним днем

#pragma mark -

- (NSDateComponents *)fullComponents;   // Возвращает компоненты для даты и времени
- (NSDateComponents *)dayComponents;    // Возвращает компоненты для даты с округлением до дня (без часов, минут и тп)
- (NSDateComponents *)timeComponents;   // Возвращает компоненты для времени (только часы и минуты без дня, месяца, года и тп)

/**
 * Возвращает дату с округлением до дня
 */
- (instancetype)dayDate;

/**
 * Возвращает дату с округлением до времени
 */
- (instancetype)timeDate;

- (NSInteger)daysToDate:(NSDate *)date; // Возвращает количество дней до даты

- (BOOL)isWeekend;                      // Проверяет, является ли день выходным

- (instancetype)nextDay;                    // Возвращает дату cо следующим днем
- (instancetype)previousDay;                // Возвращает дату c предыдущим днем
- (instancetype)firstDayOfNextMonth;		// Первый день следующего месяца
- (instancetype)lastDayOfPreviousMonth;		// Последний день пердыдущего месяца

- (instancetype)dateByAddingDays:(NSInteger)days;
- (instancetype)dateByAddingHours:(NSInteger)hours;
- (instancetype)dateByAddingMinutes:(NSInteger)minutes;
- (instancetype)dateByAddingHours:(NSInteger)hours minutes:(NSInteger)minutes;
- (instancetype)dateByAddingDays:(NSInteger)days hours:(NSInteger)hours minutes:(NSInteger)minutes;

- (instancetype)dateBySettingDays:(NSInteger)days;

#pragma mark - 

/**
 * Возвращает строковое представление даты с округлением до дня в дефолтной локализации
 */
- (NSString *)dayString;

/**
 * Парсит дату из строки, полученной через метод dayString
 */
+ (NSDate *)dateFromDayString:(NSString *)str;

/**
 * Возвращает строковое представление даты в дефолтной локализации
 */
- (NSString *)dateTimeString;

/**
 * Парсит дату из строки, полученной через метод dateTimeString
 */
+ (NSDate *)dateFromDateTimeString:(NSString *)str;


@end