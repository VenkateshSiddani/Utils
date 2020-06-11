//
//  UISearchBar+CUUtils.m
//  Utils
//
//  Created by Timur Yusipov on 03.10.14.
//  Copyright (c) 2014 CT Consulting. All rights reserved.
//

#import "UISearchBar+CUUtils.h"

@implementation UISearchBar (CUUtils)

- (UITextField *)textField {
    UITextField *textField = [self findTextFieldInList:self.subviews];
    
    if (! textField) {
        // похоже, что в iOS 8 textField лежит глубже на один уровень
        for (UIView *view in self.subviews) {
            textField = [self findTextFieldInList:view.subviews];
            if (textField) {
                break;
            }
        }
    }

    return textField;
}

- (UITextField *)findTextFieldInList:(NSArray *)list {
    UITextField *textField;
    
    for (UIView *view in list) {
        if ([view isKindOfClass:[UITextField self]]) {
            textField = (id)view;
            break;
        }
    }
    
    return textField;
}

@end
