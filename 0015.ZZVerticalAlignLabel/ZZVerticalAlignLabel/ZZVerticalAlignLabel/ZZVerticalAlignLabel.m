//
//  ZZVerticalAlignLabel.m
//  ZZVerticalAlignLabel
//
//  Created by iot_iMac on 2018/6/19.
//  Copyright © 2018年 iot_iMac. All rights reserved.
//

#import "ZZVerticalAlignLabel.h"

@implementation ZZVerticalAlignLabel

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.contentMode = UIViewContentModeRedraw;
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    self.contentMode = UIViewContentModeRedraw;
}

//FIXME:重写如下方法，可以调整文字在UILabel中的显示位置
- (CGRect)textRectForBounds:(CGRect)bounds limitedToNumberOfLines:(NSInteger)numberOfLines
{
    //获取系统自动计算的文字text在UILabel中的显示方位，bounds是UILabel的bounds，textRect是label中文字的位置
    CGRect textRect = [super textRectForBounds:bounds limitedToNumberOfLines:numberOfLines];
    
    if (self.verticalAlignment == ZZVerticalAlignmentTop)
    {
        textRect.origin.y = 0;
    }
    else if (self.verticalAlignment == ZZVerticalAlignmentBottom)
    {
        textRect.origin.y = bounds.size.height - textRect.size.height;
    }
    else
    {
        //默认为nil(数字0)，即ZZVerticalAlignmentCenter
        textRect.origin.y = (bounds.size.height - textRect.size.height )/2;
    }
    
    return textRect;//返回相对bounds的坐标
}

- (void)drawTextInRect:(CGRect)rect
{
    CGRect r = [self textRectForBounds:rect limitedToNumberOfLines:self.numberOfLines];
    
    [super drawTextInRect:r];
}

@end

