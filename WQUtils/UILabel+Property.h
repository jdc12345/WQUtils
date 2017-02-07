//
//  UILabel+Property.h
//  UILabel扩展
//
//  Created by mac on 15/12/2.
//  Copyright © 2015年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (Property)

/**
 *  创建一个指定的 UILable
 *
 *  @param fontname      字体名称
 *  @param fontsize      字体大小
 *  @param textcolor     文字颜色（背景默认透明）
 *  @param textAlignment 文字对齐方式
 *
 *  @return UILabel
 */
+(UILabel*) makeLabelWithFontName:(NSString*)fontname
                         FontSize:(float)fontsize
                        textColor:(UIColor*)textcolor
                    textAlignment:(NSTextAlignment)textAlignment;
/**
 *  计算动态Label的高度
 *
 *  @param width         label的宽度
 *  @param strContent    Label显示的字符串
 *  @param font          Label.font
 *  @param lineBreakMode 换行模式
 *
 *  @return size.height
 */
- (float)dynamicHeightLabelWithWidth:(CGFloat)width
                          strContent:(NSString *)strContent
                                font:(UIFont *)font
                       lineBreakMode:(NSLineBreakMode)lineBreakMode;


@end
