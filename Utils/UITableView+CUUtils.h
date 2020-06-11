//
//  UITableView+P34Utils.h
//  Intuit
//
//  Created by Глеб Тарасов on 13.01.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableView (CUUtils)

/**
 *  Загрузить ячейку определенного класса. 
 *  cell identifier должен совпадать с именем класса
 *
 *  @param class класс ячейки
 */
- (id)cellFromStoryboard:(Class)class;


/**
 *  Загрузить ячейку определенного класса.
 *  cell identifier должен совпадать с именем класса, имя xib также должно совпадать с именем класса.
 *
 *  @param class класс ячейки
 */
- (id)cellFromNib:(Class)class;


/**
 *  Загрузить ячейку определенного класса.
 *  cell identifier должен совпадать с именем класса из указанного UINib
 *
 *  @param nib источник ячейки
 *  @param class класс ячейки
 */
- (id)cellFromNib:(UINib *)nib class:(Class)class;

/**
 *  Подогнать высоту таблицы под размер ее содержимого.
 */
- (void)heightToFit;

@end
