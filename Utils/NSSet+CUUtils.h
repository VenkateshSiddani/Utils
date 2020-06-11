//
//  NSSet+CUUtils.h
//  Utils
//
//  Created by User on 27.11.14.
//  Copyright (c) 2014 CT Consulting. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSSet (CUUtils)

/**
 *  Получение множества без одного элемента, если он есть.
 *  Если такого элемента нет, то просто полная копия.
 *
 *  @param object элемент, который удаляем, если он есть
 *
 *  @return копия без одного элемента
 */
- (NSSet *)setByRemovingObject:(id)object;

@end
