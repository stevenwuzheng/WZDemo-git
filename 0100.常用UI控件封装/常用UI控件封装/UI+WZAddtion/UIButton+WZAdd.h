//
//  UIButton+WZAdd.h
//  常用UI控件封装
//
//  Created by iot_iMac on 2018/6/21.
//  Copyright © 2018年 iot_iMac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (WZAdd)

+ (UIButton *)createBtnFrame:(CGRect)frame bgColor:(UIColor *)bgColor font:(UIFont *)font norTitle:(NSString *)norTitle selTitle:(NSString *)selTitle norImage:(UIImage *)norImage selImage:(UIImage *)selImage target:(id)target action:(SEL)action  extraBlock:(void(^)(UIButton *btn))extraBlock;

@end
