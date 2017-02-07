//
//  UIImage+CutScreen.m
//  LQToolKit
//
//  Created by liufeng on 16/5/10.
//  Copyright © 2016年 hzdracom. All rights reserved.
//

#import "UIImage+CutScreen.h"

@implementation UIImage (CutScreen)

+(UIImage *)imageCutScreen{
    @autoreleasepool{
        UIGraphicsBeginImageContextWithOptions([UIApplication sharedApplication].keyWindow.bounds.size, YES, 1);
        [[UIApplication sharedApplication].keyWindow.layer renderInContext:UIGraphicsGetCurrentContext()];
        UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        return image;
    }
}

@end
