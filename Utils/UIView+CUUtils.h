//
//  UIView+CUUtils.h
//  Utils
//
//  Created by Gleb Tarasov on 13.03.14.
//  Copyright (c) 2014 CT Consulting. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (CUUtils)

/**
 *  Загрузить view из xib. Имя xib должно совпадать с именем класса.
 *
 *  @return UIView, загруженный из xib
 */
+ (id)fromNib;

- (UIViewController *)findViewController;

@end
