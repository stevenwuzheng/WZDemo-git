//
//  ViewController.m
//  TestNotify
//
//  Created by iot_wz on 2019/3/4.
//  Copyright © 2019 iot_iMac. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        NSLog(@"---viewDidLoad:%@",[NSThread currentThread]);
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(test1) name:@"test_notify" object:nil];
    });
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_global_queue(0, 0), ^{
        NSLog(@"---dispatch_after1111:%@",[NSThread currentThread]);
        [[NSNotificationCenter defaultCenter] postNotificationName:@"test_notify" object:nil];
    });
}

- (void)test1 {
    NSLog(@"---test1:%@",[NSThread currentThread]);
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        NSLog(@"---touchesBegan:%@",[NSThread currentThread]);
        [[NSNotificationCenter defaultCenter] postNotificationName:@"test_notify" object:nil];
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(10 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
             NSLog(@"---dispatch_after:%@",[NSThread currentThread]);
            [[NSNotificationCenter defaultCenter] postNotificationName:@"test_notify" object:nil];
        });

    });
    
}




@end

