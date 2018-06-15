//
//  ViewController.m
//  Bugly-Test
//
//  Created by iot_iMac on 2018/6/15.
//  Copyright © 2018年 iot_iMac. All rights reserved.
//

#import "ViewController.h"
#import <Bugly/Bugly.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //bugly自定义上报
    NSString *lineNo = [NSString stringWithFormat:@"file:%s--line:%d--func:%s",__FILE__,__LINE__,__FUNCTION__];
    
    [Bugly reportExceptionWithCategory:3 name:@"测试bugly自定义上报" reason:@"点击了self.view" callStack:@[self,[NSDate date]] extraInfo:@{@"line":lineNo} terminateApp:NO];
    
    
}


-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    //测试bugly崩溃上报能力
    id obj = @[][2];
    NSLog(@"---obj:%@",obj);
}

@end
