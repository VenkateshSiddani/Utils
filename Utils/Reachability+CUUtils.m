//
//  Reachability+Utils.m
//  Intuit
//
//  Created by Глеб Тарасов on 06.04.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Reachability+CUUtils.h"


@implementation Reachability (CUUtils)

+ (Reachability *)wifiShared {
    static Reachability *__shared;
    static dispatch_once_t oncePredicate;
    dispatch_once(&oncePredicate, ^{
        __shared = [Reachability reachabilityForLocalWiFi];
    });
    return __shared;
}

+ (Reachability *)internetShared {
    static Reachability *__shared;
    static dispatch_once_t oncePredicate;
    dispatch_once(&oncePredicate, ^{
        __shared = [Reachability reachabilityForInternetConnection];
    });
    
    return __shared;
}

+ (BOOL)isWiFiReachable {
    return [[self wifiShared] isReachable];
}

+ (BOOL)isInternetReachable {
    return [[self internetShared] isReachable];
}

@end
