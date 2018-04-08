//
//  ZW_RowItem.m
//  MineSettingDemo
//
//  Created by WZ on 2017/11/9.
//  Copyright © 2017年 WZ. All rights reserved.
//

#import "ZW_RowItem.h"
#import "ZW_PublicHeader.h"

@implementation ZW_RowItem

+(instancetype _Nonnull )itemWithLeftImage:(nullable NSString *)imageName titleText:(nullable NSString *)title detailText:(nullable NSString *)detailStr accImage:(nullable NSString *)accImageName isShowArrow:(BOOL)isShowArrow {
    return [self zw_itemWithLeftImage:imageName titleText:title detailText:detailStr accImage:accImageName accLabelText:nil isShowSwitch:NO isShowArrow:isShowArrow];
}

+(instancetype _Nonnull )itemWithLeftImage:(nullable NSString *)imageName titleText:(nullable NSString *)title detailText:(nullable NSString *)detailStr accLabelText:(nullable NSString *)accLabelStr isShowArrow:(BOOL)isShowArrow {
    return [self zw_itemWithLeftImage:imageName titleText:title detailText:detailStr accImage:nil accLabelText:accLabelStr isShowSwitch:NO isShowArrow:isShowArrow];
}

+(instancetype _Nonnull )itemWithLeftImage:(nullable NSString *)imageName titleText:(nullable NSString *)title detailText:(nullable NSString *)detailStr isShowSwitch:(BOOL)isShowSwitch {//显示开关时,一定不能显示箭头和accLabel
    return [self zw_itemWithLeftImage:imageName titleText:title detailText:detailStr accImage:nil accLabelText:nil isShowSwitch:isShowSwitch isShowArrow:NO];
}


+(instancetype _Nonnull )zw_itemWithLeftImage:(nullable NSString *)imageName titleText:(nullable NSString *)title detailText:(nullable NSString *)detailStr accImage:(nullable NSString *)accImageName accLabelText:(nullable NSString *)accLabelStr isShowSwitch:(BOOL)isShowSwitch isShowArrow:(BOOL)isShowArrow {
    
    ZW_RowItem *rowItem = [[ZW_RowItem alloc] init];
    rowItem.leftImageName = imageName;
    rowItem.titleStr = title;
    rowItem.detailStr = detailStr;
    rowItem.accImageName = accImageName;
    rowItem.accLabelStr = accLabelStr;
    rowItem.isShowSwitch = isShowSwitch;
    rowItem.isShowArrow = isShowArrow;
    
    //以下是默认的
    rowItem.rowHeight = ZW_RowHeight;
    rowItem.isLeftImageCircle = NO;
    rowItem.isAccImageCircle = NO;
    rowItem.isSwitchOn = NO;
    
    return rowItem;
}

@end
