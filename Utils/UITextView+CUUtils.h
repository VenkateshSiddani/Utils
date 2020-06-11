//
//  UITextView+CUUtils.h
//  Utils
//
//  Created by Gleb Tarasov on 17.05.14.
//  Copyright (c) 2014 CT Consulting. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextView (CUUtils)

/**
 *  Установить html-содержимое.
 *  Работает через NSAttributedString
 */
- (void)setHtmlString:(NSString *)string;

@end
