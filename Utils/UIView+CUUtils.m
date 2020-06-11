//
//  UIView+CUUtils.m
//  Utils
//
//  Created by Gleb Tarasov on 13.03.14.
//  Copyright (c) 2014 CT Consulting. All rights reserved.
//

#import "UIView+CUUtils.h"

@implementation UIView (CUUtils)

+ (id)fromNib {
    NSArray *views = [NSBundle.mainBundle loadNibNamed:NSStringFromClass(self.class)
                                                 owner:nil
                                               options:nil];
    return views.firstObject;
}

- (UIViewController *)findViewController {

    Class vcc = [UIViewController class];
    
    UIResponder *responder = self;
    while ((responder = [responder nextResponder]))
        if ([responder isKindOfClass: vcc])
            return (UIViewController *)responder;
    
    return nil;
}

@end
