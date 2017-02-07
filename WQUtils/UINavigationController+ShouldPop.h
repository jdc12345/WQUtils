//
//  UINavigationController+ShouldPop.h
//  UIViewMainThread
//
//  Created by 魏琦 on 17/2/5.
//  Copyright © 2017年 com.drcacom.com. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol UINavigationControllerShouldPopDelegate <NSObject>

- (BOOL)selecBackBtnShouldPopWithNavigationController:(UINavigationController *)navigationController;
- (BOOL)shouldPopWithinteractivePopWithNavigationController:(UINavigationController *)navigationController;


@end


@interface UINavigationController (ShouldPop)<UIGestureRecognizerDelegate>


@end
