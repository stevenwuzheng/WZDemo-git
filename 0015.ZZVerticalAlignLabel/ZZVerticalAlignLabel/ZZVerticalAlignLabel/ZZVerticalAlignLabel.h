//
//  ZZVerticalAlignLabel.h
//  ZZVerticalAlignLabel
//
//  Created by iot_iMac on 2018/6/19.
//  Copyright © 2018年 iot_iMac. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, ZZVerticalAlignment) {
    ZZVerticalAlignmentCenter  = 0,
    ZZVerticalAlignmentTop     = 1,
    ZZVerticalAlignmentBottom  = 2,
};

@interface ZZVerticalAlignLabel : UILabel

/**
 * default is BBVerticalAlignmentCenter
 */
@property (nonatomic, assign) ZZVerticalAlignment verticalAlignment;

@end
