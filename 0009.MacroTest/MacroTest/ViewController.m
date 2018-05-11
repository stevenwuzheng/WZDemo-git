//
//  ViewController.m
//  MacroTest
//
//  Created by iot_iMac on 2018/5/11.
//  Copyright © 2018年 iot_iMac. All rights reserved.
//

#import "ViewController.h"

#define TestNum  30

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSLog(@"---ViewController/TestNum:%d",TestNum);
}

@end

/*
 结论：
 1. 在不同文件中定义同名宏为不同的值，编译时不会有任何影响
 2. 在同一文件不同位置定义同名宏为不同的值，编译时会报警告，最终以最后一次定义的值为准
 */
