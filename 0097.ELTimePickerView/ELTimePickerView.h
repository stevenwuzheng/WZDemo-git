//
//  ELTimePickerView.h
//  Elink
//
//  Created by iot_user on 2019/3/5.
//  Copyright © 2019年 iot_iMac. All rights reserved.
//

#import <UIKit/UIKit.h>

#define DefaultYear 1992
#define DefaultMonth 6
#define DefaultDay   15

#define BeginYear 1900
#define TimeSeparator @"-"

NS_ASSUME_NONNULL_BEGIN

typedef void(^selectTimeBlock)(NSInteger year,NSInteger month,NSInteger day);
@interface ELTimePickerView : UIView

@property (nonatomic, copy) selectTimeBlock selectBlock;


@property (nonatomic, copy) NSString *title;

@property (nonatomic, assign) NSInteger selectYear;

@property (nonatomic, assign) NSInteger selectMonth;

@property (nonatomic, assign) NSInteger selectDay;


- (void)showInView:(UIView *)view;
@end

NS_ASSUME_NONNULL_END
