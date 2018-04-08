//
//  ZW_TableViewController.m
//  MineSettingDemo
//
//  Created by WZ on 2017/11/9.
//  Copyright © 2017年 WZ. All rights reserved.
//

#import "ZW_TableViewController.h"
#import "ZW_PublicHeader.h"
#import "ZW_TableViewCell.h"

@interface ZW_TableViewController ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation ZW_TableViewController

#pragma mark ============ lazy load ==============
- (NSMutableArray *)sectionsArr {
    if (_sectionsArr == nil) {
        _sectionsArr = [NSMutableArray array];
    }
    return _sectionsArr;
}

#pragma mark ============ life circle ==============
- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 设置背景
    self.view.backgroundColor = [UIColor whiteColor];
    
    //手动添加tableView
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
    tableView.backgroundColor = ZW_TableViewColor;
    //tableView.sectionFooterHeight = 0; //代理动态设置
    //tableView.sectionHeaderHeight = 15;
    tableView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone; //干掉系统自带的分割线,全部使用自定义的
    tableView.showsVerticalScrollIndicator = NO;
    [self.view addSubview:tableView];
    _tableView = tableView;
    
    //代理
    _tableView.dataSource = self;
    _tableView.delegate = self;
    
    //ios10的适配
    if (@available(iOS 11.0, *)) {
        _tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentAutomatic;//会自动适配iPhoneX的四周insets
    } else {
        self.automaticallyAdjustsScrollViewInsets = YES;
    }
    
    //子类需要设置时,自己重新赋值即可
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, _tableView.bounds.size.width, 0.1)];
    _tableView.tableHeaderView = view; //默认为nil,会导致group类型的表格顶部出现35的空白
    _tableView.tableFooterView = view;
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];

    _tableView.frame = self.view.bounds;
}

#pragma mark ============ UITableView dataSource ==============
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.sectionsArr.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // 根据section获得对应的组模型
    ZW_SectionItem  *sectionItem = self.sectionsArr[section];
    return sectionItem.rowItemsArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    //1.创建或重用cell
    ZW_TableViewCell *cell = [ZW_TableViewCell cellWithTableView:tableView sectionsArr:self.sectionsArr indexPath:indexPath];
    
    //2.返回cell
    return cell;
}



#pragma mark ============ UITableView delegate ==============
/**
 *  Tag:1 组头部标题
 */
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {

    ZW_SectionItem *sectionItem = self.sectionsArr[section];
    return sectionItem.sectionHeaderTitle;
}
/**
 *  Tag:2 组尾部标题
 */
- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section {

    ZW_SectionItem *sectionItem = self.sectionsArr[section];
    return sectionItem.sectionFooterTitle;
}
/**
 *  Tag:3 组头View(会覆盖Tag:1)
 */
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    ZW_SectionItem *sectionItem = self.sectionsArr[section];
    return  sectionItem.sectionHeaderView;
}
/**
 *  Tag:4 组尾View(会覆盖Tag:2)
 */
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    ZW_SectionItem *sectionItem = self.sectionsArr[section];
    return  sectionItem.sectionFooterView;
}

/**
 *  单独设置某一个cell的组头高度
 */
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    ZW_SectionItem *sectionItem = self.sectionsArr[section];
    return sectionItem.sectionHeaderHeight;
}
/**
 *  单独设置某一个cell的组尾高度
 */
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    ZW_SectionItem *sectionItem = self.sectionsArr[section];
    return sectionItem.sectionFooterHeight;
}


/**
 *  单独设置某一个cell的高度
 */
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ZW_SectionItem *sectionItem = self.sectionsArr[indexPath.section];
    ZW_RowItem *rowItem = sectionItem.rowItemsArr[indexPath.row];
    return rowItem.rowHeight;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // 取消选择效果
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    // 根据组号获得组模型
    ZW_SectionItem *sectionItem = self.sectionsArr[indexPath.section];
    // 根据行号获得item模型
    ZW_RowItem *rowItem = sectionItem.rowItemsArr[indexPath.row];

    //cell的点击事件
    if (rowItem.selectRowBlock) {
        rowItem.selectRowBlock();
    }

}


@end
