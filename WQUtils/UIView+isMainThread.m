//
//  UIView+isMainThread.m
//  UIViewMainThread
//
//  Created by 魏琦 on 17/1/23.
//  Copyright © 2017年 com.drcacom.com. All rights reserved.
//

#import "UIView+isMainThread.h"
#import "SwizzingMethod.h"

@implementation UIView (isMainThread)
+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        SEL needsLayoutOriginMethod = @selector(setNeedsLayout);
        SEL needsLayoutSwizzingMethod = @selector(wq_setNeedsLayout);
        exchangeOriginMethodWithSwizzingMethod(self, needsLayoutOriginMethod, needsLayoutSwizzingMethod);
        SEL setNeedsDisplayOriginMethod = @selector(setNeedsDisplay);
        SEL setNeedsDisplaySwizzingMethod = @selector(wq_setNeedsDisplay);
        exchangeOriginMethodWithSwizzingMethod(self,setNeedsDisplayOriginMethod, setNeedsDisplaySwizzingMethod);
        SEL setNeedsDisplayInRectOriginMethod = @selector(setNeedsDisplayInRect:);
        SEL setNeedsDisplayInRectSwizzingMethod = @selector(wq_setNeedsDisplayInRect:);
        exchangeOriginMethodWithSwizzingMethod(self, setNeedsDisplayInRectOriginMethod, setNeedsDisplayInRectSwizzingMethod);
        
    });
}

- (void)wq_setNeedsLayout{
    [self viewDrawRectIsMainThread];
    [self wq_setNeedsLayout];
}

- (void)wq_setNeedsDisplay {
    [self viewDrawRectIsMainThread];
    [self wq_setNeedsDisplay];
}

- (void)wq_setNeedsDisplayInRect:(CGRect)rect {
    [self viewDrawRectIsMainThread];
    [self wq_setNeedsDisplayInRect:rect];
}

- (void)viewDrawRectIsMainThread {
    NSString *isMainthread = [NSString stringWithFormat:@"class:%@",self.class];
    NSAssert([NSThread isMainThread], isMainthread);
}
@end
