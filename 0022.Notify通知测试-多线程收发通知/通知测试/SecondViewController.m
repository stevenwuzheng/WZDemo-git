//
//  SecondViewController.m
//  通知测试
//
//  Created by iot_iMac on 2018/7/30.
//  Copyright © 2018年 iot_iMac. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

#pragma mark ============ 发送通知 ==============
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"发通知" style:UIBarButtonItemStylePlain target:self action:@selector(postNotify)];
}

- (void)postNotify {
    [[NSNotificationCenter defaultCenter] postNotificationName:@"UserIconHasChanged_Notify" object:nil];
}


#pragma mark ============ 接收通知 ==============

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(multiNotify) name:@"UserIconHasChanged_Notify" object:nil];
}

- (void)multiNotify {
    NSLog(@"---用户修改了用户头像");
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.navigationController pushViewController:[UIViewController new] animated:YES];
}


@end
