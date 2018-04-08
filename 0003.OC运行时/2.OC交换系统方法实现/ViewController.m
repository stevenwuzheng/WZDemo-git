//
//  ViewController.m
//  2.OC交换系统方法实现
//
//  Created by wujia121 on 17/5/29.
//  Copyright © 2017年 wujia121. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //测试越界
    NSArray *arr = @[@1, @2];
    id obj = arr[2];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
