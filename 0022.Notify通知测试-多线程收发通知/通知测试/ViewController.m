//
//  ViewController.m
//  通知测试
//
//  Created by iot_iMac on 2018/7/30.
//  Copyright © 2018年 iot_iMac. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //主线程监听通知
    NSLog(@"---监听通知线程:%@",[NSThread currentThread]);
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(test) name:@"Test_Notify" object:nil];
}




- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.navigationController pushViewController:[SecondViewController new] animated:YES];
    
    //子线程发送通知
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        NSLog(@"---POST通知线程:%@",[NSThread currentThread]);
        [[NSNotificationCenter defaultCenter] postNotificationName:@"Test_Notify" object:nil];

    });
}


- (void)test {
    NSLog(@"---主线程监听Test_Notify通知，子线程POST了该通知，监听方法test被调用了。调用线程:%@",[NSThread currentThread]);

}

@end
