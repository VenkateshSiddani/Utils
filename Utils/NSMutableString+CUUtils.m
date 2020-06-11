//
//  NSMutableString+Utils.m
//  iGuides
//
//  Created by Глеб Тарасов on 27.05.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "NSMutableString+CUUtils.h"
#import "NSString+CUUtils.h"

@implementation NSMutableString (CUUtils)

- (void)replaceOccurrencesOfString:(NSString *)pattern withString:(NSString *)replaceStr {
    [self replaceOccurrencesOfString:pattern
                          withString:replaceStr
                             options:0
                               range:self.fullRange];
}

@end
