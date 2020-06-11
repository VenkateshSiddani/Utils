//
//  UIAlertView+CUUtils.h
//  Utils
//
//  Created by Gleb Tarasov on 25.04.14.
//  Copyright (c) 2014 CT Consulting. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CUUtils.h"

@interface UIAlertView (CUUtils)

/**
 *  Удобный метод для отображения алерта. Создает и сразу показывает UIAlertView.
 *
 *  @param title        заголовок
 *  @param text         текст
 *  @param cancelButton текст в кнопке
 *  @param action       действие по нажатию на единственную кнопку
 */
+ (void)showTitle:(NSString *)title
             text:(NSString *)text
     cancelButton:(NSString *)cancelButton
           action:(BasicBlock)action;


/**
 *  Удобный метод для отображения алерта. Создает и сразу показывает UIAlertView.
 *
 *  @param title        заголовок
 *  @param text         текст
 *  @param cancelButton текст единственной кнопки
 */
+ (void)showTitle:(NSString *)title
             text:(NSString *)text
     cancelButton:(NSString *)cancelButton;

/**
 *  Удобный метод для отображения алерта. Создает и сразу показывает UIAlertView.
 *
 *  @param text         текст
 *  @param cancelButton текст единственной кнопки
 */
+ (void)showText:(NSString *)text
    cancelButton:(NSString *)cancelButton;


/**
 *  Удобный метод для отображения алерта. Создает и сразу показывает UIAlertView.
 *
 *  @param title        заголовок
 *  @param text         текст
 *  @param cancelButton текст кнопки отмены
 *  @param submitButton текст кнопки подтверждения
 *  @param action       действие, выполяется если нажали на submitButton
 */
+ (void)showTitle:(NSString *)title
             text:(NSString *)text
     cancelButton:(NSString *)cancelButton
     submitButton:(NSString *)submitButton
           action:(BasicBlock)action;


/**
 *  Удобный метод для отображения алерта. Создает и сразу показывает UIAlertView.
 *
 *  @param title        заголовок
 *  @param text         текст
 *  @param cancelButton текст кнопки отмены
 *  @param submitButton текст кнопки подтверждения
 *  @param action       действие по нажатию кнопки submitButton
 *  @param cancelAction действие по нажатию кнопки cancelButton
 */
+ (void)showTitle:(NSString *)title
             text:(NSString *)text
     cancelButton:(NSString *)cancelButton
     submitButton:(NSString *)submitButton
           action:(BasicBlock)action
     cancelAction:(BasicBlock)cancelAction;

@end
