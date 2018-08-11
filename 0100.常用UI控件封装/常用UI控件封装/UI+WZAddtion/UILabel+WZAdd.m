//
//  UILabel+WZAdd.m
//  常用UI控件封装
//
//  Created by iot_iMac on 2018/6/21.
//  Copyright © 2018年 iot_iMac. All rights reserved.
//

#import "UILabel+WZAdd.h"

@implementation UILabel (WZAdd)

+ (UILabel *)createLabelFrame:(CGRect)frame text:(NSString *)text textColor:(UIColor *)textColor bgColor:(UIColor *)bgColor font:(UIFont *)font align:(NSTextAlignment)align extraBlock:(void(^)(UILabel *lbl))extraBlock {
    
    UILabel *lbl = [[UILabel alloc] initWithFrame:frame];
    lbl.textAlignment = align;
    lbl.numberOfLines = 0;
    
    if (text) {
        lbl.text = text;
    }

    if (textColor) {
        lbl.textColor = textColor;
    }

    if (bgColor) {
        lbl.backgroundColor = bgColor;
    }
    
    if (font) {
        lbl.font = font;
    }

    //外部添加的一些其他设置
    if(extraBlock) {
        extraBlock(lbl);
    }
    
    return lbl;
}

@end
