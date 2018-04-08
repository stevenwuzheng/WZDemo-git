//
//  ViewController.m
//  PNChartDemo
//
//  Created by WZ on 2018/3/5.
//  Copyright © 2018年 xcamera. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    NSArray *itemNameArr = @[@"折线图",@"直方图",@"饼状图"];
    NSMutableArray *rowArrM = [NSMutableArray array];
    
    for (int i = 0; i < itemNameArr.count; i++) {
        ZW_RowItem *row = [ZW_RowItem itemWithLeftImage:nil titleText:itemNameArr[i] detailText:nil accLabelText:nil isShowArrow:YES];
        row.selectRowBlock = ^{
            UIViewController *vc = [[NSClassFromString(@"PNChartVc") alloc] init];
            vc.title = itemNameArr[i];
            [self.navigationController pushViewController:vc animated:YES];
        };
        [rowArrM addObject:row];
    }

    ZW_SectionItem *section = [ZW_SectionItem itemWithHeader_H:20 footer_H:20 headerTitle:@"PNChart测试" footerTitle:@"这是tableView的底部View" rowItemsArr:rowArrM.copy];
    
    [self.sectionsArr addObject:section];
    
}


@end
