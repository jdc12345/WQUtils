//
//  NSString+Valid.h
//  BaseFramework
//
//  Created by Regan on 15/4/24.
//  Copyright (c) 2015年 Jeffrey. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Validdate)

// 是否为空格
- (BOOL)isBlank;

// 是否有效
- (BOOL)isValid;

//去掉字符串前后空格
- (NSString*)removeWhiteSpacesFromString;

/**
 *  @author Jeffrey.Dai, 15-12-09 14:12:53
 *
 *  验证是否为手机号
 *
 *  @return
 */
- (BOOL)validatePhoneNumber;

/**
 *  @author Jeffrey.Dai, 15-12-09 14:12:18
 *
 *  验证是否合法（一般用于校验输入密码场景 假如字符串不属于英文字母大小写或数字 会返回NO）
 *
 *  @return
 */
- (BOOL)validateIsForbidden;

@end
