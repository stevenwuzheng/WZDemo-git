//
//  UIImage+WZCircle.m
//  MineSettingDemo
//
//  Created by WZ on 2017/11/10.
//  Copyright © 2017年 WZ. All rights reserved.
//

#import "UIImage+ZWCircle.h"

@implementation UIImage (ZWCircle)


- (UIImage *)zw_circleImage {
    
    UIGraphicsBeginImageContextWithOptions(self.size, NO, [UIScreen mainScreen].scale);
    [[UIColor clearColor] setFill];
    CGRect rect = CGRectMake(0, 0, self.size.width, self.size.height);
    UIRectFill(rect);
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:rect];
    
    [path addClip];
    [self drawInRect:rect];
    //获取新图片
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    //关闭上下文
    UIGraphicsEndImageContext();
    return newImage;
}


@end
