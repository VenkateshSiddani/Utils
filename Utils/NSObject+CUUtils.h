//
//  NSObject+CUUtils.h
//  Utils
//
//  Created by Gleb Tarasov on 26.06.14.
//  Copyright (c) 2014 CT Consulting. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (CUUtils)

/**
 *  Получить все дочерние классы текущего класса.
 *
 *  @return список дочерних классов, сам класс не включается в список
 */
+ (NSArray *)findAllChildClasses;

@end
