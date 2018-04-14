//
//  PNChartVc.m
//  PNChartDemo
//
//  Created by WZ on 2018/3/5.
//  Copyright © 2018年 xcamera. All rights reserved.
//

#import "PNChartVc.h"
#import "PNChart.h"

@interface PNChartVc ()

@end

@implementation PNChartVc

- (void)viewDidLoad {
    [super viewDidLoad];
    //@[@"折线图",@"直方图",@"饼状图"]
    if ([self.title isEqualToString:@"折线图"]) {
        [self drawLineChart];
    }
    else if ([self.title isEqualToString:@"直方图"]) {
        [self drawBarChart];
    }
    else if ([self.title isEqualToString:@"饼状图"]) {
        [self drawPieChart];
    }
}

- (void)drawLineChart {
    
    //创建折线图表
    PNLineChart *lineChart = [[PNLineChart alloc] init];
    lineChart.frame = CGRectMake(0, 100, self.view.bounds.size.width, 300);
    [self.view addSubview:lineChart];
    
    //统一设置画布宽高
    lineChart.chartMarginTop = 25;
    lineChart.chartMarginLeft = 25;
    lineChart.chartMarginBottom = 25;
    lineChart.chartMarginRight = 25;
    
    //lineChart.chartCavanWidth = self.view.bounds.size.width - leftMargin - rightMargin;
    //lineChart.chartCavanHeight = self.view;
    
    lineChart.xLabels = @[@"T1",@"T2",@"T3",@"T4"];
    lineChart.yLabels = @[@"100",@"200",@"300",@"400",@"500",@"600"];
    
    NSArray *dataArr = @[@120.3,@250,@200,@400];
    PNLineChartData *data = [[PNLineChartData alloc] init];
    data.color = PNRed;
    data.inflexionPointStyle = PNLineChartPointStyleCircle;
    data.inflexionPointColor = PNGreen;
    data.itemCount = lineChart.xLabels.count;
    data.getData = ^PNLineChartDataItem *(NSUInteger item) {
        PNLineChartDataItem *dataItem = [PNLineChartDataItem dataItemWithY: [dataArr[item] floatValue]];
        return dataItem;
    };
    lineChart.chartData = @[data];
    [lineChart strokeChart];
    
    
}

- (void)drawBarChart {
    
}

- (void)drawPieChart {
    
}

@end
