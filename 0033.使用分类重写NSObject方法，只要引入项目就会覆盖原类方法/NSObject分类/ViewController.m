//
//  ViewController.m
//  NSObject分类
//
//  Created by iot_imac on 2018/12/28.
//  Copyright © 2018年 iot_iMac. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    [ViewController performSelector:@selector(runYou)];
    
    [UIButton performSelector:@selector(runYou)];
}


@end
