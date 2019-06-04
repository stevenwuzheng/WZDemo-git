//
//  ViewController.m
//  Test_Draw
//
//  Created by iot_wz on 2019/2/18.
//  Copyright © 2019 iot_iMac. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
}


- (void)drawRect1 {
    
    CAShapeLayer *testLayer = [CAShapeLayer layer]; //这就相当于一个特殊的画布，这个画布它有个path路径属性，可以利用CGContextPath或者UIBezierPath来绘制这个path
    testLayer.backgroundColor = [UIColor lightGrayColor].CGColor;
    testLayer.frame = CGRectMake(0, 0, 200, 200);
    testLayer.position = self.view.layer.position;
    [self.view.layer addSublayer:testLayer];
    
    //开始在特殊画布中绘图
    UIBezierPath *bezierPath = [UIBezierPath bezierPathWithRect:(CGRectMake(0, 0, 50, 50))];
    bezierPath.lineWidth = 10; //此处设置不管用
    
    testLayer.path = bezierPath.CGPath;
    testLayer.fillColor = [UIColor greenColor].CGColor;
    testLayer.strokeColor = [UIColor redColor].CGColor;
    testLayer.lineWidth = 10; //Defaults to one默认为1
    testLayer.lineCap = kCALineCapButt;
    testLayer.lineJoin = kCALineJoinRound;
    testLayer.strokeStart = 0;
    testLayer.strokeEnd = 0;
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        //添加动画
        CABasicAnimation *anim = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
        anim.fromValue = @0;
        anim.toValue = @1;
        anim.duration = 3;
        anim.repeatCount = 2;
        anim.speed = 3; //默认是1,设为3就是默认的3倍
        anim.fillMode = kCAFillModeForwards; //默认会被移除
        [testLayer addAnimation:anim forKey:@"kAnim"];
    });
    
    
}




@end
