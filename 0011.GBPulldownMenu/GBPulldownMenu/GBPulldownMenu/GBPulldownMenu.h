//
//  CCNavigationBarMenu.h
//  GreatBody
//
//  Created by iot_iMac on 2018/6/8.
//

#import <Foundation/Foundation.h>
#import "GBPulldownMenuItem.h"
#import "GBPulldownMenuCell.h"

@interface GBPulldownMenu : NSObject

@property (nonatomic, strong) NSArray <GBPulldownMenuItem *> *items;// 菜单数据
@property (nonatomic, assign) CGRect  triangleFrame;// 三角形位置 default : CGRectMake(width-25, 0, 12, 12)

@property (nonatomic, strong) UIColor *separatorColor;// 分割线颜色 #e8e8e8
@property (nonatomic, assign) CGFloat rowHeight;// 菜单条目高度

@property (nonatomic, copy) void(^didSelectMenuItem)(GBPulldownMenu *menu, GBPulldownMenuItem *item);// 点击条目

- (instancetype)initWithOrigin:(CGPoint)origin width:(CGFloat)width;
- (void)show;
- (void)dismiss;

@end
