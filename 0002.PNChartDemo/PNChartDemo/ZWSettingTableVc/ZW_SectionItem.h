//
//  ZW_SectionItem.h
//  MineSettingDemo
//
//  Created by WZ on 2017/11/9.
//  Copyright © 2017年 WZ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


//分割线的样式
typedef enum {
    //全部有
    ZW_SectionSeparatorTypeAll,
    //上下有,中间没有
    ZW_SectionSeparatorTypeTopAndBottom,
    //上下没有,中间有
    ZW_SectionSeparatorTypeOnlyMiddle,
    //上下中间没有
    ZW_SectionSeparatorTypeNone,
}ZW_SectionSeparatorType;

@interface ZW_SectionItem : NSObject

+ (instancetype _Nonnull )itemWithHeader_H:(CGFloat)headerH footer_H:(CGFloat)footerH headerTitle:(nullable NSString *)headerTitle footerTitle:(nullable NSString *)footerTitle rowItemsArr:(nonnull NSArray *)itemsArr;

+ (instancetype _Nonnull )itemWithHeader_H:(CGFloat)headerH footer_H:(CGFloat)footerH headerTitle:(nullable NSString *)headerTitle footerTitle:(nullable NSString *)footerTitle separatorType:(ZW_SectionSeparatorType)type separatorLeftOffset:(CGFloat)offset rowItemsArr:(nonnull NSArray *)itemsArr;

+ (instancetype _Nonnull )itemWithHeader_H:(CGFloat)headerH footer_H:(CGFloat)footerH headerView:(nullable UIView *)headerView footerView:(nullable UIView *)footerView rowItemsArr:(nonnull NSArray *)itemsArr;

+ (instancetype _Nonnull )itemWithHeader_H:(CGFloat)headerH footer_H:(CGFloat)footerH headerView:(nullable UIView *)headerView footerView:(nullable UIView *)footerView separatorType:(ZW_SectionSeparatorType)type separatorLeftOffset:(CGFloat)offset rowItemsArr:(nonnull NSArray *)itemsArr;


// ---------- 以下属性可以在上面类方法中一次性设置，也可以使用[alloc init]创建section,然后单独设置以下属性 ------------

/**
 * 每个section都拥有一个rowItemsArr，里面装着决定这个section中每个row特征的rowItem模型
 */
@property (nonnull, nonatomic, strong) NSArray *rowItemsArr;

/**
 *  设置组头高度
 */
@property (nonatomic, assign) CGFloat  sectionHeaderHeight;

/**
 *  设置组尾高度
 */
@property (nonatomic, assign) CGFloat  sectionFooterHeight;

/**
 组 头部标题
 */
@property (nullable, nonatomic, strong) NSString *sectionHeaderTitle;

/**
 组 尾部标题
 */
@property (nullable, nonatomic, strong) NSString *sectionFooterTitle;

/**
 组 头部View(自定义view会覆盖组头部标题)
 */
@property (nullable, nonatomic, strong) UIView *sectionHeaderView;

/**
 组 尾部View(自定义view会覆盖组尾部标题)
 */
@property (nullable, nonatomic, strong) UIView *sectionFooterView;

/**
 *  分割线的样式
 */
@property (nonatomic, assign) ZW_SectionSeparatorType separatorType;

/**
 *  分割线前端留多长的空白段,除了数值,还可以设置
 */
@property (nonatomic, assign) CGFloat separatorLeftOffset;


@end
