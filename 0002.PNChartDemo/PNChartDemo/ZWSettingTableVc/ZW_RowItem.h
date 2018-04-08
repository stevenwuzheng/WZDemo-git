//
//  ZW_RowItem.h
//  MineSettingDemo
//
//  Created by WZ on 2017/11/9.
//  Copyright © 2017年 WZ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ZW_RowItem : NSObject

+(instancetype _Nonnull )itemWithLeftImage:(nullable NSString *)imageName titleText:(nullable NSString *)title detailText:(nullable NSString *)detailStr accImage:(nullable NSString *)accImageName isShowArrow:(BOOL)isShowArrow;

+(instancetype _Nonnull )itemWithLeftImage:(nullable NSString *)imageName titleText:(nullable NSString *)title detailText:(nullable NSString *)detailStr accLabelText:(nullable NSString *)accImageName isShowArrow:(BOOL)isShowArrow;

+(instancetype _Nonnull )itemWithLeftImage:(nullable NSString *)imageName titleText:(nullable NSString *)title detailText:(nullable NSString *)detailStr isShowSwitch:(BOOL)isShowSwitch;


/**
 *  cell左侧图片
 */
@property (nullable, copy, nonatomic) NSString *leftImageName;

/**
 *  icon是否设置成圆形
 */
@property (nonatomic, assign) BOOL isLeftImageCircle;

/**
 *  标题的名称
 */
@property (nullable, copy, nonatomic) NSString *titleStr;

/**
 *  副标题名称
 */
@property (nullable, nonatomic, strong) NSString *detailStr;

/**
 *  末尾图片
 */
@property (nullable, nonatomic, strong) NSString *accImageName;

/**
 *  判断尾部图片是否需要圆角处理
 */
@property (nonatomic, assign) BOOL isAccImageCircle;


/**
 *  label样式的文字
 */
@property (nullable, nonatomic, strong) NSString *accLabelStr;

/**
 *  是否隐藏箭头
 */
@property (nonatomic, assign) BOOL isShowArrow;

/**
 *  是否显示开关
 */
@property (nonatomic, assign) BOOL isShowSwitch;

/**
 *  是否显示开关
 */
@property (nonatomic, assign) BOOL isSwitchOn;

/**
 *  此处是单独设定某个cell的高度,优先级比ZW_SectionItem中统一设定的rowHeight高
 */
@property (assign, nonatomic) CGFloat rowHeight;


/**
 *  cell的点击事件
 *  例如: 跳转控制器、弹出分享面板
 */
@property (nonatomic, copy) void(^ _Nullable selectRowBlock)(void);

/**
 * 当开关的转变的时候调用这个block
 */
@property (nonatomic, copy) void(^ _Nullable switchChangedBlock)(BOOL isOn);



@end
