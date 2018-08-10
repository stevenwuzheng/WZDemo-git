//
//  ViewController.m
//  Notify测试
//
//  Created by iot_iMac on 2018/8/10.
//  Copyright © 2018年 iot_iMac. All rights reserved.
//

#import "ViewController.h"
#define center       [NSNotificationCenter defaultCenter]
#define notifyName   @"Test_notify"

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [center addObserver:self selector:@selector(test1) name:notifyName object:nil];
    [center addObserver:self selector:@selector(test2) name:notifyName object:nil];
    [center addObserver:self selector:@selector(test3) name:notifyName object:nil];

}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    NSLog(@"---1");
    [center postNotificationName:notifyName object:nil];
    NSLog(@"---2"); //---1打印完会立马打印---2吗？猜测打印完---1，4s之后才会打印---2，6s后打印---sleep(6)
    
}

- (void)test1 {
    sleep(2);
    NSLog(@"---test1");
}

- (void)test2 {
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        sleep(6);
        NSLog(@"---sleep(6)");
    });
    
    NSLog(@"---test2");
}

- (void)test3 {
    sleep(4);
    NSLog(@"---test3");
}


@end
