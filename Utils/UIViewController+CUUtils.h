//
//  UIViewController+P34Utils.h
//  Intuit
//
//  Created by Глеб Тарасов on 11.01.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (Utils)

/**
 *  Загрузить контроллер из указанного xib
 *
 *  @param nibName имя xib-файла
 *
 *  @return загруженный контроллер
 */
+ (id)fromNib:(NSString *)nibName;

/**
 *  Загрузить контроллер из xib. Имя xib должно совпадать с именем класса контроллера.
 *
 *  @return загруженный контроллер
 */
+ (id)fromNib;

/**
 *  Загрузить контроллер из Storyboard. Storyboard Identifier контроллера должен совпадать с именем класса контроллера
 *
 *  @param storyboard сторибоард для загрузки
 *
 *  @return Готовый контроллер
 */
+ (id)fromStoryboard:(UIStoryboard *)storyboard;

/**
 *  Загрузить контроллер из Storyboard, но создать наследника контроллера. Storyboard Identifier контроллера должен совпадать с именем класса контроллера
 *
 *  @param storyboard сторибоард для загрузки
 *  @param subclass   наследник получателя сообщения
 *
 *  @return Готовый контроллер
 */
+ (id)fromStoryboard:(UIStoryboard *)storyboard withSubclass:(Class)subclass;

/**
 *  Загрузить контроллер, обернутый в UINavigationController, из Storyboard.
 *  Storyboard identifier navigation-контроллера должен состоять из имени класса внутреннего контроллера и "+Navigation".
 *  Например, ListViewController+Navigation
 *
 *  @param storyboard сторибоард для загрузки
 *
 *  @return загруженный navigationController
 */
+ (UINavigationController *)fromStoryboardWithNavigation:(UIStoryboard *)storyboard;

@end
