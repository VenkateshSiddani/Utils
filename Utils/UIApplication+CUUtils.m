//
//  UIApplication+Utils.m
//  Intuit
//
//  Created by Глеб Тарасов on 23.01.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "UIApplication+CUUtils.h"

@implementation UIApplication (CUUtils)

+ (BOOL)landscape {
    return UIInterfaceOrientationIsLandscape([[self sharedApplication] statusBarOrientation]);
}

+ (BOOL)areWeBeingUnitTested {
    Class testProbeClass;
    testProbeClass = NSClassFromString(@"XCTestProbe");
    if (!testProbeClass)
        return NO;
    
    // Doing this little dance so we don't actually have to link
    // Testing Kit in
    BOOL answer = NO;
    SEL selector = NSSelectorFromString(@"isTesting");
    NSMethodSignature *sig = [testProbeClass methodSignatureForSelector:selector];
    NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:sig];
    [invocation setSelector:selector];
    [invocation invokeWithTarget:testProbeClass];
    [invocation getReturnValue:&answer];
    return answer;
}

@end
