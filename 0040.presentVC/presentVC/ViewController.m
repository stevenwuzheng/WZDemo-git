//
//  ViewController.m
//  presentVC
//
//  Created by iot_wz on 2019/2/27.
//  Copyright © 2019 iot_iMac. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"home";
    self.view.backgroundColor = [UIColor greenColor];
}

-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        UIViewController *vc1 = [UIViewController new];
        vc1.view.backgroundColor =  [UIColor redColor];
        [self presentViewController:vc1 animated:YES completion:nil];
        
    });

}


/**
 点击屏幕并不会模态出yellow颜色的vc2，同时会打印：
    Warning: Attempt to present <UIViewController: 0x7febc2d12af0> on <ViewController: 0x7febc2c06090> whose view is not in the window hierarchy!
 原因：
    当一个aVC  模态present出来一个bVC后，bVC.view被加在window上了，而aVC.view不在是window的子视图了，即不在window的hierarchy层级中了。
 结论：
    一个aVC同时只能present一个bVC，不能在present着bVC的同时，又去present cVC
 */
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    UIViewController *vc2 = [UIViewController new];
    vc2.view.backgroundColor =  [UIColor yellowColor];
    [self presentViewController:vc2 animated:YES completion:nil];
}


@end
