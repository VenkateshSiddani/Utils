//
//  NSObject+CUUtils.m
//  Utils
//
//  Created by Gleb Tarasov on 26.06.14.
//  Copyright (c) 2014 CT Consulting. All rights reserved.
//

#import "NSObject+CUUtils.h"
#import <objc/runtime.h>

@implementation NSObject (CUUtils)

+ (NSArray *)findAllChildClasses {
    
    int numberOfClasses = objc_getClassList(NULL, 0);
    Class *classList = (Class *)malloc(numberOfClasses * sizeof(Class));
    numberOfClasses = objc_getClassList(classList, numberOfClasses);
    
    NSMutableArray *list = [NSMutableArray array];
    for (int i = 0; i < numberOfClasses; ++i)
    {
        Class cls = classList[i];
        
        // если не NSObject - пропускаем
        if (!class_respondsToSelector(cls, @selector(respondsToSelector:)))
            continue;
        
        //        if (!class_respondsToSelector(cls, @selector(isSubclassOfClass:)))
        //            continue;
        
        // берем только дочерние
        
        const char* nameOfClass = class_getName(cls);
        NSString* classString = [NSString stringWithUTF8String:nameOfClass];
        if(![classString containsString:@"WK"])
        {
            if ([cls isSubclassOfClass:self] && cls != self) {
                [list addObject:cls];
            }
        }
      
    }
    
    free(classList);

    
    /*int numClasses;
    Class * classes = NULL;
    NSMutableArray *list = [NSMutableArray array];
    
    classes = NULL;
    numClasses = objc_getClassList(NULL, 0);
    
    if (numClasses > 0 )
    {
        classes = (Class *) malloc(sizeof(Class) * numClasses);
        numClasses = objc_getClassList(classes, numClasses);
        for (int i = 0; i < numClasses; ++i)
        {
            Class cls = classes[i];
            
            // если не NSObject - пропускаем
            if (!class_respondsToSelector(cls, @selector(respondsToSelector:)))
                continue;
            
            if (!class_respondsToSelector(cls, @selector(isSubclassOfClass:)))
                continue;
            
            // берем только дочерние
            if ([cls isSubclassOfClass:self] && cls != self) {
                [list addObject:cls];
            }
        }
        free(classes);
    }*/
    
    
    return list;
}



@end
