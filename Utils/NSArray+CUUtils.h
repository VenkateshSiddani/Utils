//
//  NSArray+CUUtils.h
//  Utils
//
//  Created by Gleb Tarasov on 13.03.14.
//  Copyright (c) 2014 CT Consulting. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (CUUtils)

/**
 Выбор случайного элемента массива.
*/
@property(nonatomic, readonly, strong) id randomObject;

/**
 Сортирует массив строк по алфавиту, учитывая русский язык.
 @return отсортированную копию.
*/
- (NSArray *)sortedArrayAlphabetically;

/**
 *  Сортирует массив объектов по нужному свойству.
 *
 *  @param keySelector геттер свойства, по которому нужно отсортировать
 *
 *  @return отсортированную копию
 */
- (NSArray *)sortedArrayByKey:(SEL)keySelector;

/**
 *  Удаляет элемент из массива
 *
 *  @param object какой элемент удалить
 *
 *  @return копия массива без указанного элемента
 */
- (NSArray *)arrayByRemovingObject:(id)object;


/**
 *  Перемешать массив случайным образом
 *
 *  @return копия массива, случайно отсортированная
 */
- (NSArray *)shuffled;


/**
 *  Перевернуть массив, выставить элементы в обратном порядке
 *
 *  @return перевернутая копия массива
 */
- (NSArray *)reversed;

/**
 *  Взять только различные элементы массива
 *  Порядок не обязательно сохранится
 */
- (NSArray *)distinct;

/**
 *  Удаляет [NSNull null] из массива
 */
- (NSArray *)arrayByRejectingNulls;

/**
 *  Делаем bk_map и удаляем [NSNull null] из результата
 */
- (NSArray *)bk_mapAndRejectNulls:(id (^)(id obj))block;

@end
