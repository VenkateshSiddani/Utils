//
//  UIViewController+Utils.m
//  Intuit
//
//  Created by Глеб Тарасов on 11.01.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "UIViewController+CUUtils.h"

@implementation UIViewController (Utils)

+ (id)fromNib {
    NSString *nibName = NSStringFromClass(self);
    return [self fromNib:nibName];
}

+ (id)fromNib:(NSString *)nibName {
    return [[self alloc] initWithNibName:nibName bundle:nil];
}

+ (id)fromStoryboard:(UIStoryboard *)storyboard {
    return [storyboard instantiateViewControllerWithIdentifier:NSStringFromClass(self.class)];
}

+ (UINavigationController *)fromStoryboardWithNavigation:(UIStoryboard *)storyboard {
    NSString *key = [NSString stringWithFormat:@"%@+Navigation",
                     NSStringFromClass(self.class)];
    return [storyboard instantiateViewControllerWithIdentifier:key];
}

/**
 *  Здесь хранится соответствие между классом и его наследником, который нужно использовать при создании контроллера через сториборд
 */
static NSMutableDictionary *__classes;

+ (void)initialize {
    __classes = [NSMutableDictionary new];
}

+ (instancetype)fromStoryboard:(UIStoryboard *)storyboard withSubclass:(Class)subclass {
    // записываем в словарик
    if (subclass && [subclass isSubclassOfClass:self]) {
        __classes[NSStringFromClass(self)] = subclass;
    }
    
    UIViewController *result = [self fromStoryboard:storyboard];

    // очищаем словарик
    [__classes removeObjectForKey:NSStringFromClass(self)];
    
    return result;
}

+ (instancetype)alloc {
    Class subclass = __classes[NSStringFromClass(self)];
    
    if (! subclass || subclass == self)
        return [super alloc];
    
    return [subclass alloc];
}

@end
