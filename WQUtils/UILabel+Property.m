//
//  UILabel+Property.m
//  UILabel扩展
//
//  Created by mac on 15/12/2.
//  Copyright © 2015年 mac. All rights reserved.
//

#import "UILabel+Property.h"

@implementation UILabel (Property)

+(UILabel*) makeLabelWithFontName:(NSString*)fontname
                         FontSize:(float)fontsize
                        textColor:(UIColor*)textcolor
                    textAlignment:(NSTextAlignment)textAlignment {
    
    UILabel *label = [[UILabel alloc] init];
    if (!fontname || fontname.length == 0) {
        fontname = @"Arial";
    }
    label.font = [UIFont fontWithName:fontname size:fontsize];
    label.textColor = textcolor;
    label.textAlignment = textAlignment;
    
    return label;
}

- (float)dynamicHeightLabelWithWidth:(CGFloat)width
                          strContent:(NSString *)strContent
                                font:(UIFont *)font
                       lineBreakMode:(NSLineBreakMode)lineBreakMode {
    
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];//段落样式
    paragraphStyle.lineBreakMode = lineBreakMode;
    
    NSDictionary *attributes = @{NSFontAttributeName:font,
                                 NSParagraphStyleAttributeName:paragraphStyle.copy};
    
    CGSize size = [strContent boundingRectWithSize:CGSizeMake(width, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:attributes context:nil].size;
    
    return size.height;
}

@end
