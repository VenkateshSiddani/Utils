//
//  NSMutableArray+P34Utils.h
//  Intuit
//
//  Created by Глеб Тарасов on 13.01.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableArray (CUUtils)

/**
 *  Удалить первый элемент из текущего массива
 *
 *  @return удаленный первый элемент
 */
- (id)popFirstObject;

/**
 *  Удалить последний элемент из текущего массива
 *
 *  @return удаленный последний элемент
 */
- (id)popObject;

/**
 *  Удалить случайный элемент из текущего массива
 *
 *  @return удаленный случайный элемент
 */
- (id)popRandomObject;

@end
