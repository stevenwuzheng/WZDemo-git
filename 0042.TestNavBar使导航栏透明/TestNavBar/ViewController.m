//
//  ViewController.m
//  TestNavBar
//
//  Created by iot_wz on 2019/2/22.
//  Copyright © 2019 iot_iMac. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"首页";
    
//    [self test];
}

#define RGBA(r,g,b,a)       [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:(a)]
#define NavBarTintColor     RGBA(26, 155, 192, 0.1) //alpha为1时是好身材的天蓝色

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@""
                                                                             style:UIBarButtonItemStylePlain
                                                                            target:self
                                                                            action:nil];
    self.navigationController.navigationBar.barTintColor = NavBarTintColor;
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor whiteColor]};
    self.automaticallyAdjustsScrollViewInsets = NO;
    
}

- (void)test {
    
    self.navigationController.navigationBar.barTintColor = [UIColor redColor]; //#FE2625
    //    self.navigationController.navigationBar.barTintColor = [UIColor clearColor]; //并不会透明，只会变黑色
    //    self.navigationController.navigationBar.translucent = NO; //#FF0000  //此时self.view.y会紧贴导航栏下方，不要轻易更改该属性，默认为YES，改为NO会影响self.view的y
    
    //以上无论如何组合，都并不能使导航栏变透明，真正能让导航栏透明的代码如下，下面这2句优先级非常高，即使之前设置了barTintColor = [UIColor redColor];但因为下面2句，导航栏并不会显示红色，而是变为透明色
    
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault]; //使导航栏变透明; 设置了这句，就会让第一句代码barTintColor = [UIColor redColor];失效
    [self.navigationController.navigationBar setShadowImage:[UIImage new]]; //去掉导航栏下面的黑线
    
    //给self.view添加个layer
    CALayer *layer = [CALayer layer];
    layer.backgroundColor = [UIColor cyanColor].CGColor;
    layer.frame = CGRectMake(0, 0, self.view.bounds.size.width, 200);
    [self.view.layer addSublayer:layer];
    
}


@end
