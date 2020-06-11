//
//  UIApplication+P34Utils.h
//  Intuit
//
//  Created by Глеб Тарасов on 23.01.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIApplication (CUUtils)

/**
 *  Проверка текущей ориентации приложения через statusBarOrientation
 *
 *  @return YES, если сейчас приложение в landscape-ориентации
 */
+ (BOOL)landscape;


/**
 *  Является ли текущий запуск - запуском тестов?
 *
 *  @return YES, если мы сейчас в тестах
 */
+ (BOOL)areWeBeingUnitTested;

@end
