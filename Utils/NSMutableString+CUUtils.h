//
//  NSMutableString+P34Utils.h
//  iGuides
//
//  Created by Глеб Тарасов on 27.05.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableString (CUUtils)


/**
 *  Замена подстроки на другую строку. Более краткая запись метода:
 *  @code 
 *  [self replaceOccurrencesOfString:pattern
 *                        withString:replaceStr
 *                           options:0
 *                             range:NSMakeRange(0, self.length)];
 *  @endcode
 */
- (void)replaceOccurrencesOfString:(NSString *)pattern
                        withString:(NSString *)replaceStr;

@end
