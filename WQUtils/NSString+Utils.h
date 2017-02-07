//
//  NSString+Utils.h
//  UIViewMainThread
//
//  Created by 魏琦 on 17/2/6.
//  Copyright © 2017年 com.drcacom.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface NSString (Utils)
- (CGSize)stringSizeWithFont:(UIFont *)font;
- (NSString *)MD5String;
- (NSUInteger)getBytesLength;
- (NSString *)stringByDeletingPictureResolution;
@end
