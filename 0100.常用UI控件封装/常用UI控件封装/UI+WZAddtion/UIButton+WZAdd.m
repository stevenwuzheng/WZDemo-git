//
//  UIButton+WZAdd.m
//  常用UI控件封装
//
//  Created by iot_iMac on 2018/6/21.
//  Copyright © 2018年 iot_iMac. All rights reserved.
//

#import "UIButton+WZAdd.h"

@implementation UIButton (WZAdd)

+ (UIButton *)createBtnFrame:(CGRect)frame bgColor:(UIColor *)bgColor font:(UIFont *)font norTitle:(NSString *)norTitle selTitle:(NSString *)selTitle norImage:(UIImage *)norImage selImage:(UIImage *)selImage target:(id)target action:(SEL)action  extraBlock:(void(^)(UIButton *btn))extraBlock {
    
    //这3项必须有值
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = frame;
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    //以下各项均可为nil
    if (font) {
        btn.titleLabel.font = font;
    }
    
    if (bgColor) {
        [btn setBackgroundColor:bgColor];
    }

    if (norTitle) {
        [btn setTitle:norTitle forState:UIControlStateNormal];
    }
    
    if (selTitle) {
        [btn setTitle:selTitle forState:UIControlStateSelected];
    }
    
    if (norImage) {
        [btn setImage:norImage forState:UIControlStateNormal];
    }
    
    if (selImage) {
        [btn setImage:selImage forState:UIControlStateSelected];
    }
    
    if (extraBlock) {
        extraBlock(btn);
    }

    
    return btn;
}

@end
