//
//  UIAlertView+CUUtils.m
//  Utils
//
//  Created by Gleb Tarasov on 25.04.14.
//  Copyright (c) 2014 CT Consulting. All rights reserved.
//

#import "UIAlertView+CUUtils.h"

@implementation UIAlertView (CUUtils)

+ (void)showTitle:(NSString *)title
             text:(NSString *)text
     cancelButton:(NSString *)cancelButton
           action:(BasicBlock)action {
    if (!title && SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"8")) {
        // в 8ке криво смотрится алерт без названия
        // ставим пустую строку, тогда норм
        title = @"";
    }
    UIAlertView *a = [UIAlertView bk_alertViewWithTitle:title message:text];
    [a bk_addButtonWithTitle:cancelButton handler:action];
    [a show];
}

+ (void)showTitle:(NSString *)title
             text:(NSString *)text
     cancelButton:(NSString *)cancelButton {
    [self showTitle:title text:text cancelButton:cancelButton action:nil];
}

+ (void)showText:(NSString *)text
    cancelButton:(NSString *)cancelButton {
    [self showTitle:nil text:text cancelButton:cancelButton action:nil];
}

+ (void)showTitle:(NSString *)title
             text:(NSString *)text
     cancelButton:(NSString *)cancelButton
     submitButton:(NSString *)submitButton
           action:(BasicBlock)action {
    [self showTitle:title
               text:text
       cancelButton:cancelButton
       submitButton:submitButton
             action:action
       cancelAction:nil];
}


+ (void)showTitle:(NSString *)title
             text:(NSString *)text
     cancelButton:(NSString *)cancelButton
     submitButton:(NSString *)submitButton
           action:(BasicBlock)action
     cancelAction:(BasicBlock)cancelAction {
    if (!title && SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"8")) {
        // в 8ке криво смотрится алерт без названия
        // ставим пустую строку, тогда норм
        title = @"";
    }
    UIAlertView *a = [UIAlertView bk_alertViewWithTitle:title message:text];
    [a bk_addButtonWithTitle:cancelButton handler:cancelAction];
    [a bk_addButtonWithTitle:submitButton handler:action];
    [a show];
}

@end
