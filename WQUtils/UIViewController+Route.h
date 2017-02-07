//
//  UIViewController+Route.h
//  LQToolKit
//
//  Created by vicky on 15/12/7.
//  Copyright © 2015年 hzdracom. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (Route)
+ (void)registerRoute:(NSString *)route withHandler:(BOOL(^)(NSDictionary *parameters))handler;

- (NSString *)generateRouteWithStrings:(NSString *)route, ...;

- (void)triggerRoute:(NSString *)route withParameters:(NSDictionary *)parameters;
@end
