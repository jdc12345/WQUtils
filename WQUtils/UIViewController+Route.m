//
//  UIViewController+Route.m
//  LQToolKit
//
//  Created by vicky on 15/12/7.
//  Copyright © 2015年 hzdracom. All rights reserved.
//

#import "UIViewController+Route.h"
#import <JLRoutes.h>
#import "NSString+URLEncoding.h"
#import <objc/runtime.h>

@implementation UIViewController (Route)
+ (void)registerRoute:(NSString *)route withHandler:(BOOL (^)(NSDictionary *))handler
{
    [[JLRoutes globalRoutes] addRoute:route handler:handler];
}

- (NSString *)generateRouteWithStrings:(NSString *)route, ...
{
    va_list list;
    va_start(list, route);
    
    NSMutableArray *strArray = [NSMutableArray arrayWithArray:[route componentsSeparatedByString:@"/"]];
    while (YES) {
        NSString *string = va_arg(list, NSString *);
        if (!string) {
            break;
        }
        [strArray enumerateObjectsUsingBlock:^(NSString *item, NSUInteger idx, BOOL *stop) {
            if ([string isKindOfClass:[NSString class]] && [item rangeOfString:@":"].location != NSNotFound) {
                strArray[idx] = [string stringByReplacingOccurrencesOfString:@"/" withString:@" ∕ "];
                *stop = YES;
            }
        }];
    }
    va_end(list);
    return [strArray componentsJoinedByString:@"/"];
}

- (void)triggerRoute:(NSString *)route withParameters:(NSDictionary *)parameters
{
    NSDictionary *infoDic = [[NSBundle mainBundle] infoDictionary];
    NSDictionary *schemeDic = [[infoDic objectForKey:@"CFBundleURLTypes"] firstObject];
    NSString *schemeValue = [[schemeDic objectForKey:@"CFBundleURLSchemes"] firstObject];
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@:%@", schemeValue, [route stringByURLEncoding]]];
    NSMutableDictionary *parametersWithSelf = [NSMutableDictionary dictionaryWithDictionary:parameters];
    __weak typeof(self) weakSelf = self;
    parametersWithSelf[@"controller"] = weakSelf;
    [[JLRoutes globalRoutes] routeURL:url withParameters:parametersWithSelf];
}
@end
