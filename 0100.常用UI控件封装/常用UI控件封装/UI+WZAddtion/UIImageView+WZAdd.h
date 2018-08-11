//
//  UIImageView+WZAdd.h
//  常用UI控件封装
//
//  Created by iot_iMac on 2018/6/21.
//  Copyright © 2018年 iot_iMac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (WZAdd)

+ (UIImageView *)createImgViewFrame:(CGRect)frame bgColor:(UIColor *)bgColor image:(UIImage *)image contentMode:(UIViewContentMode)mode extraBlock:(void(^)(UIButton *btn))extraBlock;

@end
