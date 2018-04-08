//
//  ZW_TableViewCell.h
//  MineSettingDemo
//
//  Created by WZ on 2017/11/9.
//  Copyright © 2017年 WZ. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ZW_RowItem;
@interface ZW_TableViewCell : UITableViewCell

/**
 * ViewController中的tableView:cellForRowAtIndexPath中关于cell重用、model获取、cell赋值的代码全部移转到这个方法
 * cell的展示形态，完全取决于rowItem模型的参数设定
 */
+ (instancetype)cellWithTableView:(UITableView *)tableView sectionsArr:(NSArray *)sectionsArr indexPath:(NSIndexPath *)indexPath;

@end
