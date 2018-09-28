//
//  ViewController.m
//  国际化重复KEY测试
//
//  Created by iot_iMac on 2018/7/16.
//  Copyright © 2018年 iot_iMac. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *showLB;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.showLB.text = NSLocalizedString(@"神奇的旋风", nil);
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
}

@end
