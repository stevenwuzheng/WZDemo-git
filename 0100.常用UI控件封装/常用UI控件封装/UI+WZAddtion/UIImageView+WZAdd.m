//
//  UIImageView+WZAdd.m
//  常用UI控件封装
//
//  Created by iot_iMac on 2018/6/21.
//  Copyright © 2018年 iot_iMac. All rights reserved.
//

#import "UIImageView+WZAdd.h"

@implementation UIImageView (WZAdd)

+ (UIImageView *)createImgViewFrame:(CGRect)frame bgColor:(UIColor *)bgColor image:(UIImage *)image contentMode:(UIViewContentMode)mode extraBlock:(void(^)(UIButton *btn))extraBlock {
    
    UIImageView *imgView = [[UIImageView alloc] initWithFrame:frame];
    imgView.contentMode = mode;
    
    if (bgColor) {
        imgView.backgroundColor = bgColor;
    }

    if (image) {
        imgView.image = image;
    }

    return imgView;
}

@end
