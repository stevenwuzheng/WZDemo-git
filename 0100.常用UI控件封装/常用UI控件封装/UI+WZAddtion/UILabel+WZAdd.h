//
//  UILabel+WZAdd.h
//  常用UI控件封装
//
//  Created by iot_iMac on 2018/6/21.
//  Copyright © 2018年 iot_iMac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (WZAdd)

+ (UILabel *)createLabelFrame:(CGRect)frame text:(NSString *)text textColor:(UIColor *)textColor bgColor:(UIColor *)bgColor font:(UIFont *)font align:(NSTextAlignment)align extraBlock:(void(^)(UILabel *lbl))extraBlock;

@end
