//
//  ZW_TableViewController.h
//  MineSettingDemo
//
//  Created by WZ on 2017/11/9.
//  Copyright © 2017年 WZ. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 *  这也是暴露给外面的接口
 */
#import "ZW_SectionItem.h"
#import "ZW_RowItem.h"

@interface ZW_TableViewController : UIViewController

/**
 *  使用方法:
 * 1.继承ZW_TableViewController
 * 2.创建rowItem和sectionItem
 * 3.将多个rowItem加入到seciton.rowItems
 * 4.将多个section加入到self.sectionsArr
 * 注意：以上2-4在viewDidLoad中创建
 */
@property (nonatomic, strong) NSMutableArray *sectionsArr;


/**
 父类的属性如果写在.m中，子类就无法调用,只能用KVC或runtime获取到
 */
@property (nonatomic, weak) UITableView *tableView;

@end
