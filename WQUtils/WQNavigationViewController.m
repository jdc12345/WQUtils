//
//  WQNavigationViewController.m
//  UIViewMainThread
//
//  Created by 魏琦 on 17/2/5.
//  Copyright © 2017年 com.drcacom.com. All rights reserved.
//

#import "WQNavigationViewController.h"
@interface UINavigationController (UINavigationViewControllerNeedshouldPopItem)
- (BOOL)navigationBar:(UINavigationBar *)navigationBar shouldPopItem:(UINavigationItem *)item;

@end
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wincomplete-implementation"
@implementation UINavigationController (UINavigationViewControllerNeedshouldPopItem)
@end
#pragma clang diagnostic pop
@interface WQNavigationViewController () <UINavigationBarDelegate>

@end

@implementation WQNavigationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (BOOL)navigationBar:(UINavigationBar *)navigationBar shouldPopItem:(UINavigationItem *)item {
    UIViewController * vc = self.topViewController;
    if (item != vc.navigationItem) {
        return [super navigationBar:navigationBar shouldPopItem:item];
    }
    if ([vc conformsToProtocol:@protocol(WQNavigationViewControllerPopDelegate)]) {
        if ([(id <WQNavigationViewControllerPopDelegate>)vc selectSystemBackBtnWithNavigationController:self]) {
            return [super navigationBar:navigationBar shouldPopItem:item];
        }
        else {
            return NO;
        }
    }
    else {
        return [super navigationBar:navigationBar shouldPopItem:item];
    }
}

@end
