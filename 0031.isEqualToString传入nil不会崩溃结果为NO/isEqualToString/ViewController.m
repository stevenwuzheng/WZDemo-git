//
//  ViewController.m
//  isEqualToString
//
//  Created by iot_imac on 2018/12/14.
//  Copyright © 2018年 iot_iMac. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *str1 = @"xxx";
    NSString *str2 = nil;
    
    BOOL ret1 = [str1 isEqualToString:str2]; //传入nil,居然不会崩溃
    NSLog(@"---ret1:%d",ret1);

    
    BOOL ret2 = [str2 isEqualToString:str1];
    NSLog(@"---ret2:%d",ret2);
    
}

/*
 2018-12-14 14:53:28.681453+0800 isEqualToString[98036:920140] ---ret1:0
 2018-12-14 14:53:28.681573+0800 isEqualToString[98036:920140] ---ret2:0
 */

@end
