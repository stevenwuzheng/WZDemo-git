//
//  ViewController.m
//  ZZVerticalAlignLabel
//
//  Created by iot_iMac on 2018/6/19.
//  Copyright © 2018年 iot_iMac. All rights reserved.
//

#import "ViewController.h"
#import "ZZVerticalAlignLabel.h"


@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self createLabel:CGRectMake(10, 10, 300, 100) numLines:2 bgColor:UIColor.orangeColor align:ZZVerticalAlignmentTop text:@"111测试第一条数据哦"];
    [self createLabel:CGRectMake(10, 150, 300, 100) numLines:2 bgColor:UIColor.orangeColor align:ZZVerticalAlignmentCenter text:@"222测试第一条数据哦"];
    [self createLabel:CGRectMake(10, 300, 300, 100) numLines:10 bgColor:UIColor.orangeColor align:ZZVerticalAlignmentBottom text:@"333测试第一条数据哦"];
    
    UILabel *lbl = [self createLabel:CGRectMake(10, 420, 300, 100) numLines:0 bgColor:UIColor.orangeColor align:ZZVerticalAlignmentBottom text:@"444测试第一条数据哦"];
    lbl.textAlignment = NSTextAlignmentCenter;
    
}

- (UILabel *)createLabel:(CGRect)frame numLines:(NSInteger)lines bgColor:(UIColor *)color align:(ZZVerticalAlignment)align text:(NSString *)str
{
    ZZVerticalAlignLabel *lbl = [[ZZVerticalAlignLabel alloc] init];
    lbl.frame = frame;
    lbl.numberOfLines = lines;
    lbl.backgroundColor = color;
    lbl.verticalAlignment = align;
    lbl.text = str;
    
    [self.view addSubview:lbl];
    return lbl;
}


@end
