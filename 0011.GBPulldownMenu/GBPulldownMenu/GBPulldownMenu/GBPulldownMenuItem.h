//
//  CCNavigationBarMenuItem.h
//  GreatBody
//
//  Created by iot_iMac on 2018/6/8.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "Masonry.h"

#define ITEM_IMAGE_SIZE CGSizeMake(22,22)
#define GBSetViewH(view, newH) view.frame = CGRectMake(view.frame.origin.x, view.frame.origin.y, view.frame.size.width, newH)

@interface GBPulldownMenuItem : NSObject

@property (nonatomic, strong) UIImage  *image;// 图标
@property (nonatomic, copy  ) NSString *title;// 标题

@property (nonatomic, strong) UIColor  *titleColor;// 颜色   #4a4a4a
@property (nonatomic, strong) UIFont   *titleFont;// 字体大小 system 15.5  17

+ (instancetype)navigationBarMenuItemWithImage:(UIImage *)image title:(NSString *)title;

@end
