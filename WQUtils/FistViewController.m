//
//  FistViewController.m
//  UIViewMainThread
//
//  Created by 魏琦 on 17/2/5.
//  Copyright © 2017年 com.drcacom.com. All rights reserved.
//

#import "FistViewController.h"
#import "UINavigationController+ShouldPop.h"
//#import "WQNavigationViewController.h"
@interface FistViewController ()<UINavigationControllerShouldPopDelegate>//WQNavigationViewControllerPopDelegate

@end

@implementation FistViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"second";
    self.view.backgroundColor = [UIColor redColor];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//- (BOOL)selectSystemBackBtnWithNavigationController:(WQNavigationViewController *)navigationController {
- (BOOL)selecBackBtnShouldPopWithNavigationController:(UINavigationController *)navigationController {
    NSLog(@"%@",navigationController);
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"是否放弃编辑?" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self.navigationController popViewControllerAnimated:YES];
    }];
    UIAlertAction *action2 = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        [self.navigationItem setHidesBackButton:YES];
        [self.navigationItem setHidesBackButton:NO];
    }];
    [alert addAction:action];
    [alert addAction:action2];
    [self.navigationController presentViewController:alert animated:YES completion:nil];
    
    
    return NO;
}

- (BOOL)shouldPopWithinteractivePopWithNavigationController:(UINavigationController *)navigationController {
    NSLog(@"%@",navigationController);
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"是否放弃编辑?" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self.navigationController popViewControllerAnimated:YES];
    }];
    UIAlertAction *action2 = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        [self.navigationItem setHidesBackButton:YES];
        [self.navigationItem setHidesBackButton:NO];
    }];
    [alert addAction:action];
    [alert addAction:action2];
    [self.navigationController presentViewController:alert animated:YES completion:nil];
    
    
    return NO;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
