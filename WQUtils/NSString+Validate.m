//
//  NSString+Valid.m
//  BaseFramework
//
//  Created by Regan on 15/4/24.
//  Copyright (c) 2015年 Jeffrey. All rights reserved.
//

#import "NSString+Validate.h"

@implementation NSString (Validdate)

// 判断是否为空格
- (BOOL)isBlank{
    return ([[self removeWhiteSpacesFromString] isEqualToString:@""]) ? YES : NO;
}

// 是否有效
- (BOOL)isValid{
    return ([[self removeWhiteSpacesFromString] isEqualToString:@""] || [self isEqualToString:@"(null)"] || [self isEqualToString:@"null"]) ? NO : YES;
}

// 去除字符串的前后空格
- (NSString *)removeWhiteSpacesFromString{
    NSString *trimmedString = [self stringByTrimmingCharactersInSet:
                               [NSCharacterSet whitespaceAndNewlineCharacterSet]];
    return trimmedString;
}

- (BOOL)validatePhoneNumber{
    NSString *phoneRegex = @"^1[3|4|5|6|7|8][0-9]{9}$";
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",phoneRegex];
    return [phoneTest evaluateWithObject:self];
}

- (BOOL)validateIsForbidden{
    NSCharacterSet *pswCharacters = [[NSCharacterSet characterSetWithCharactersInString:@"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"] invertedSet];
    NSRange pswRange = [self rangeOfCharacterFromSet:pswCharacters];
    if (pswRange.location != NSNotFound) {
        return NO;
    }
    return YES;
}

@end
