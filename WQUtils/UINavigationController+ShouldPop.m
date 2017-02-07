//
//  UINavigationController+ShouldPop.m
//  UIViewMainThread
//
//  Created by 魏琦 on 17/2/5.
//  Copyright © 2017年 com.drcacom.com. All rights reserved.
//

#import "UINavigationController+ShouldPop.h"
#import "SwizzingMethod.h"

@implementation UINavigationController (ShouldPop)
+ (void)load {
    SEL originSelector = @selector(viewDidLoad);
    SEL newSwizzingSelector = @selector(wq_viewDidLoad);
    exchangeOriginMethodWithSwizzingMethod(self, originSelector, newSwizzingSelector);
    SEL popOriginSelector = @selector(navigationBar: shouldPopItem:);
    SEL newPopSwizzingSelector = @selector(newNavigationBar: shouldPopItem:);
    exchangeOriginMethodWithSwizzingMethod(self,popOriginSelector,newPopSwizzingSelector);
}
static char * KPopinteractiveDelegate;

- (void)wq_viewDidLoad {
    [self wq_viewDidLoad];
    self.interactivePopGestureRecognizer.enabled = YES;
    objc_setAssociatedObject(self, KPopinteractiveDelegate,self.interactivePopGestureRecognizer.delegate, OBJC_ASSOCIATION_ASSIGN);
    self.interactivePopGestureRecognizer.delegate = (id<UIGestureRecognizerDelegate>)self;
}

- (BOOL)newNavigationBar:(UINavigationBar *)navigationBar shouldPopItem:(UINavigationItem *)item {
    UIViewController *vc = self.topViewController;
    if (item != vc.navigationItem) {
        return YES;
    }
    if ([vc conformsToProtocol:@protocol(UINavigationControllerShouldPopDelegate)]) {
        if ([(id <UINavigationControllerShouldPopDelegate>)vc selecBackBtnShouldPopWithNavigationController:self]) {
            return [self newNavigationBar:navigationBar shouldPopItem:item];
        }
        else {
            return NO;
        }
    }
    else {
        return [self newNavigationBar:navigationBar shouldPopItem:item];
    }
}

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {
    if (gestureRecognizer == self.interactivePopGestureRecognizer) {
        UIViewController *vc = self.topViewController;
        if ([vc conformsToProtocol:@protocol(UINavigationControllerShouldPopDelegate)]) {
            if (![(id <UINavigationControllerShouldPopDelegate>)vc shouldPopWithinteractivePopWithNavigationController:self]) {
                return NO;
            }
        }
        id <UIGestureRecognizerDelegate>newDelegate = objc_getAssociatedObject(self, KPopinteractiveDelegate);
        return [newDelegate gestureRecognizerShouldBegin:gestureRecognizer];
    }
    return YES;
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch {
    if (gestureRecognizer == self.interactivePopGestureRecognizer) {
        id <UIGestureRecognizerDelegate>newDelegate = objc_getAssociatedObject(self, KPopinteractiveDelegate);
        return [newDelegate gestureRecognizer:gestureRecognizer shouldReceiveTouch:touch];
    }
    return YES;
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    if (gestureRecognizer == self.interactivePopGestureRecognizer) {
        id <UIGestureRecognizerDelegate>newDelegate = objc_getAssociatedObject(self, KPopinteractiveDelegate);
        return [newDelegate gestureRecognizer:gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:otherGestureRecognizer];
    }
    return YES;
}
@end
