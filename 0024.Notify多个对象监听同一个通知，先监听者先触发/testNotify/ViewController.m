//
//  ViewController.m
//  testNotify
//
//  Created by wujia121 on 2018/8/9.
//  Copyright © 2018年 steven. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //先添加进通知中心，先触发通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(test111) name:@"test_notify" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(test) name:@"test_notify" object:nil];
}


- (void)test {
    sleep(3);
    NSLog(@"----3");
}

- (void)test111 {
    sleep(2);
    NSLog(@"----4");
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"----1");
    [[NSNotificationCenter defaultCenter] postNotificationName:@"test_notify" object:nil];
    NSLog(@"----2");
}


/**
 2018-12-01 08:36:15.464974+0800 testNotify[49217:11429947] ----1
 2018-12-01 08:36:17.465394+0800 testNotify[49217:11429947] ----4
 2018-12-01 08:36:20.465986+0800 testNotify[49217:11429947] ----3
 2018-12-01 08:36:20.466365+0800 testNotify[49217:11429947] ----2
 */
@end
