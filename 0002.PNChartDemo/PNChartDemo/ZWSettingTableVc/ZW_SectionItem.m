//
//  ZW_SectionItem.m
//  MineSettingDemo
//
//  Created by WZ on 2017/11/9.
//  Copyright © 2017年 WZ. All rights reserved.
//

#import "ZW_SectionItem.h"
#import "ZW_PublicHeader.h"

@implementation ZW_SectionItem


+ (instancetype _Nonnull )itemWithHeader_H:(CGFloat)headerH footer_H:(CGFloat)footerH headerTitle:(nullable NSString *)headerTitle footerTitle:(nullable NSString *)footerTitle rowItemsArr:(nonnull NSArray *)itemsArr {
    
    return [self zw_itemWithRowsHeight:headerH sectionHeaderHeight:footerH sectionFooterHeight:headerH sectionHeaderTitle:footerTitle sectionFooterTitle:footerTitle sectionHeaderView:nil sectionFooterView:nil separatorType:ZW_SectionSeparatorTypeAll separatorLeftOffset:ZW_SeparatorLeftOffset rowItemsArr:itemsArr];
    
}

+ (instancetype _Nonnull )itemWithHeader_H:(CGFloat)headerH footer_H:(CGFloat)footerH headerTitle:(nullable NSString *)headerTitle footerTitle:(nullable NSString *)footerTitle separatorType:(ZW_SectionSeparatorType)type separatorLeftOffset:(CGFloat)offset rowItemsArr:(nonnull NSArray *)itemsArr {
    
    return [self zw_itemWithRowsHeight:headerH sectionHeaderHeight:footerH sectionFooterHeight:headerH sectionHeaderTitle:footerTitle sectionFooterTitle:footerTitle sectionHeaderView:nil sectionFooterView:nil separatorType:type separatorLeftOffset:offset rowItemsArr:itemsArr];
}

+ (instancetype _Nonnull )itemWithHeader_H:(CGFloat)headerH footer_H:(CGFloat)footerH headerView:(nullable UIView *)headerView footerView:(nullable UIView *)footerView rowItemsArr:(nonnull NSArray *)itemsArr {
    
    return [self zw_itemWithRowsHeight:headerH sectionHeaderHeight:footerH sectionFooterHeight:headerH sectionHeaderTitle:nil sectionFooterTitle:nil sectionHeaderView:headerView sectionFooterView:footerView separatorType:ZW_SectionSeparatorTypeAll separatorLeftOffset:ZW_SeparatorLeftOffset rowItemsArr:itemsArr];
}

+ (instancetype _Nonnull )itemWithHeader_H:(CGFloat)headerH footer_H:(CGFloat)footerH headerView:(nullable UIView *)headerView footerView:(nullable UIView *)footerView separatorType:(ZW_SectionSeparatorType)type separatorLeftOffset:(CGFloat)offset rowItemsArr:(nonnull NSArray *)itemsArr {
    
    return [self zw_itemWithRowsHeight:headerH sectionHeaderHeight:footerH sectionFooterHeight:headerH sectionHeaderTitle:nil sectionFooterTitle:nil sectionHeaderView:headerView sectionFooterView:footerView separatorType:type separatorLeftOffset:offset rowItemsArr:itemsArr];
}



/**
 这个是最根本的方法，上面的方法都调用这个
 */
+ (instancetype _Nonnull)zw_itemWithRowsHeight:(CGFloat)rowsH sectionHeaderHeight:(CGFloat)headerH sectionFooterHeight:(CGFloat)footerH sectionHeaderTitle:(nullable NSString *)headerTitle sectionFooterTitle:(nullable NSString *)footerTitle sectionHeaderView:(nullable UIView *)headerView sectionFooterView:(nullable UIView *)footerView separatorType:(ZW_SectionSeparatorType)type separatorLeftOffset:(CGFloat)offset rowItemsArr:(nonnull NSArray *)itemsArr {
    
    ZW_SectionItem *item = [[ZW_SectionItem alloc] init];

    item.sectionHeaderHeight = headerH ? headerH : ZW_SectionHeaderH;
    item.sectionFooterHeight = footerH ? footerH : ZW_SectionFooterH;
    item.sectionHeaderTitle = headerTitle;
    item.sectionFooterTitle = footerTitle;
    item.sectionHeaderView = headerView;
    item.sectionFooterView = footerView;
    item.separatorType = type;
    item.separatorLeftOffset = offset;
    item.rowItemsArr = itemsArr;
    
    return item;
}

@end
