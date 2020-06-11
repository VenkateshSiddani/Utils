//
//  Reachability+P34Utils.h
//  Intuit
//
//  Created by Глеб Тарасов on 06.04.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Reachability/Reachability.h>

@interface Reachability (CUUtils)

/**
 *  Проверка - доступен ли сейчас Wi-Fi
 *
 *  @return YES, если доступен.
 */
+ (BOOL)isWiFiReachable;

/**
 *  Проверка - доступен ли сейчас интернет. 
 *  Это не означает, что он обязательно работает. То есть может быть в наличии edge, но соединение 
 *  настолько медленное, что ничего не грузится.
 *
 *  @return YES, если доступен.
 */
+ (BOOL)isInternetReachable;

@end
