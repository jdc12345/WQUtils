//
//   
//  niuniuios
//
//  Created by jack zhou on 14-1-23.
//  Copyright (c) 2014年 JZ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (DeviceId)
//获取uuid 这个uuid  是存在keychain中的，不刷机的前提下 每次获取都是一样的
+ (NSString *)staticUUID;
@end
