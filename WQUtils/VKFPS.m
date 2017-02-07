//
//  VKFPS.m
//  UIViewMainThread
//
//  Created by 魏琦 on 17/2/6.
//  Copyright © 2017年 com.drcacom.com. All rights reserved.
//

#import "VKFPS.h"
#import <UIKit/UIKit.h>
@interface VKFPS ()
{
    UILabel *vk_FpsLable;
    CADisplayLink *vk_displayLink;
    NSUInteger vk_count;
    NSTimeInterval vk_lastTime;
}
@end

@implementation VKFPS
+ (instancetype)shareInstance
{
    static VKFPS *instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[VKFPS alloc] init];
    });
    return instance;
}

- (instancetype)init {
    if (self = [super init]) {
        vk_displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(trackingOfTheRefreshOfRate:)];
        //默认为NO,设置为yes刷新后不发送通知
        [vk_displayLink setPaused:YES];
        [vk_displayLink addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSRunLoopCommonModes];
        
        vk_FpsLable = [[UILabel alloc] initWithFrame:CGRectMake(([UIScreen mainScreen].bounds.size.width-50) /2 +50,0,50,20)];
        vk_FpsLable.backgroundColor = [UIColor clearColor];
        vk_FpsLable.textColor = [UIColor orangeColor];
        vk_FpsLable.textAlignment = NSTextAlignmentCenter;
        vk_FpsLable.font = [UIFont systemFontOfSize:12];
        vk_FpsLable.tag = 10086;
        [[NSNotificationCenter defaultCenter] addObserver: self
                                                 selector: @selector(applicationDidBecomeActiveNotification)
                                                     name: UIApplicationDidBecomeActiveNotification
                                                   object: nil];
        
        [[NSNotificationCenter defaultCenter] addObserver: self
                                                 selector: @selector(applicationWillResignActiveNotification)
                                                     name: UIApplicationWillResignActiveNotification
                                                   object: nil];
    }
    return self;
}

- (void)opne {
    NSArray *rootViewSubviews = [[UIApplication sharedApplication].delegate window].rootViewController.view.subviews;
    for (UIView *view in rootViewSubviews) {
        if ([view isKindOfClass:[UILabel class]] && view.tag == 10086) {
            return;
        }
    }
    [vk_displayLink setPaused:NO];
    [[[UIApplication sharedApplication].delegate window].rootViewController.view addSubview:vk_FpsLable];
    
}

- (void)close {
    NSArray *rootViewSubviews = [[UIApplication sharedApplication].delegate window].rootViewController.view.subviews;
    for (UIView *view in rootViewSubviews) {
        if ([view isKindOfClass:[UILabel class]] && view.tag == 10086) {
            [vk_displayLink setPaused:YES];
            [vk_FpsLable removeFromSuperview];
        }
    }
    
}

- (void)trackingOfTheRefreshOfRate:(CADisplayLink*)link{
    if (vk_lastTime == 0) {
        vk_lastTime = link.timestamp;
        return;
    }
    vk_count++;
    NSTimeInterval timeDiff = link.timestamp-vk_lastTime;
    if (timeDiff<1) {
        return;
    }
    vk_lastTime = link.timestamp;
    float vkFps = vk_count/timeDiff;
    //roundf 是四舍五入函数
    
    NSString *fps = [NSString stringWithFormat:@"%d FPS",(int)round(vkFps)];
    [vk_FpsLable setText:fps];
    vk_count = 0;
}

- (void)applicationDidBecomeActiveNotification {
    [vk_displayLink setPaused:NO];
}

- (void)applicationWillResignActiveNotification {
    [vk_displayLink setPaused:YES];
}
@end
