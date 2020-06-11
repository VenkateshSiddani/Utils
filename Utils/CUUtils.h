//
//  CFUUtils.h
//  Utils
//
//  Created by Gleb Tarasov on 13.03.14.
//  Copyright (c) 2014 CT Consulting. All rights reserved.
//

#import <Foundation/Foundation.h>

#pragma mark - Сообщения

#define CUUTILS_ERROR @"Error"
#define CUUTILS_MESSAGE_ABSTRACT_METHOD @"Subclasses must override this method"  

#pragma mark - Вывод в консоль

/**
 *  Печать в консоль только в debug-режиме
 */
#ifdef DEBUG
//#   define DLog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__)
#   define DLog(...)
#else
#   define DLog(...)
#endif

#ifdef DEBUG
//#   define DLog2(fmt, ...) NSLog(@"\n"); NSLog((@"%s [Line %d]" fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);NSLog(@"\n");
#   define DLog2(...)
#else
#   define DLog2(...)
#endif

#ifdef DEBUG
//#   define DLog3(fmt, ...) NSLog(@"\n"); NSLog((@"%s [Line %d]" fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);NSLog(@"\n");
#   define DLog3(...)
#else
#   define DLog3(...)
#endif

/**
 *  ALog - печать в любом случае, в debug и release
 */
#define ALog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__) 

#pragma mark - Полезные макросы

#define APP_VERSION (NSBundle.mainBundle.infoDictionary)[@"CFBundleVersion"]

#define UIViewAutoresizingAll UIViewAutoresizingFlexibleLeftMargin \
| UIViewAutoresizingFlexibleWidth\
| UIViewAutoresizingFlexibleRightMargin\
| UIViewAutoresizingFlexibleTopMargin\
| UIViewAutoresizingFlexibleHeight\
| UIViewAutoresizingFlexibleBottomMargin


#define SYSTEM_VERSION_EQUAL_TO(v)                  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedSame)
#define SYSTEM_VERSION_GREATER_THAN(v)              ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedDescending)
#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN(v)                 ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN_OR_EQUAL_TO(v)     ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedDescending)

#define WSELF           __weak typeof(self) wself = self
#define RGB(r, g, b) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:1]
#define RGBA(r, g, b, a) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:(a)]


#define DOCUMENT_DIRECTORY [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject]

#pragma mark - Удобные блоки

typedef void(^BasicBlock)(void);
typedef void(^IdBlock)(id obj);
typedef void(^ObjectBlock)(NSObject *obj);
typedef void(^StringBlock)(NSString *str);
typedef void(^NumberBlock)(NSNumber *num);
typedef void(^ArrayBlock)(NSArray *arr);
typedef void(^DictionaryBlock)(NSDictionary *dict);
typedef void(^SetBlock)(NSSet *set);
typedef void(^IntegerBlock)(NSInteger num);
typedef void(^BoolBlock)(BOOL val);
typedef void(^ErrorBlock)(NSError *error); 

#pragma mark - Вспомогательные функции

/**
 *  Выполнить блок в главном потоке через какое-то время
 *
 *  @param delay на сколько отложить выполнение
 *  @param action блок действия
 */
void doAfter(NSTimeInterval delay, BasicBlock action);

/**
 *  Выполнить действие в фоновом потоке
 */
void doInBackground(BasicBlock action);

/**
 *  Выполнить действие в главном потоке
 */
void doOnMain(BasicBlock action);

/**
 *  Является ли текущее устройство iPhone c экраном 4 дюйма.
 */
BOOL isIphone5();


/**
 *  Является ли текущее устройство iPad.
 */
BOOL isIpad();

/**
 *  Имеет ли текущее устройство retina-экран
 */
BOOL isRetina(); 

#pragma mark - Подключение все хедеров

#import <BlocksKit/BlocksKit.h>
#import <BlocksKit/BlocksKit+UIKit.h>
#import <FrameAccessor/FrameAccessor.h>

#import "NSArray+CUUtils.h"
#import "NSDate+CUUtils.h"
#import "NSMutableArray+CUUtils.h"
#import "NSMutableString+CUUtils.h"
#import "NSObject+CUUtils.h"
#import "NSSet+CUUtils.h"
#import "NSString+CUUtils.h"
#import "Reachability+CUUtils.h"
#import "UIAlertView+CUUtils.h"
#import "UIApplication+CUUtils.h"
#import "UIColor+CUUtils.h"
#import "UIImage+CUUtils.h"
#import "UILabel+CUUtils.h"
#import "UITableView+CUUtils.h"
#import "UITextView+CUUtils.h"
#import "UIView+CUUtils.h"
#import "UIViewController+CUUtils.h"
#import "UISearchBar+CUUtils.h"
