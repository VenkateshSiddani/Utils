//
//  UITextView+CUUtils.m
//  Utils
//
//  Created by Gleb Tarasov on 17.05.14.
//  Copyright (c) 2014 CT Consulting. All rights reserved.
//

#import "UITextView+CUUtils.h"

@implementation UITextView (CUUtils)

- (void)setHtmlString:(NSString *)string {

    NSData *data = [string dataUsingEncoding:NSUTF8StringEncoding];
    NSAttributedString *attributedString = [[NSAttributedString alloc] initWithData:data
                                                                            options:@{ NSDocumentTypeDocumentAttribute : NSHTMLTextDocumentType,
                                                                                       NSCharacterEncodingDocumentAttribute : @(NSUTF8StringEncoding)
                                                                                       }
                                                                 documentAttributes:nil
                                                                              error:nil];
    [self setAttributedText:attributedString];
}

@end
