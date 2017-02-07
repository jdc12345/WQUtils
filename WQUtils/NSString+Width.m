//
//  NSString+Width.m
//  StringW
//
//  Created by baiyihan on 15/12/14.
//  Copyright © 2015年 baiyihan. All rights reserved.
//

#import "NSString+Width.h"

@implementation NSString (Width)

-(float) suggestedSizeWithFont:(UIFont *)font;
{
    CGSize size =[self sizeWithAttributes:@{NSFontAttributeName:font}];
    
    return size.width;
}
@end
