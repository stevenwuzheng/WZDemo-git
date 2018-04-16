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
    PNLineChart *lineChart = [[PNLineChart alloc] initWithFrame:CGRectMake(0, 100, self.view.bounds.size.width, 300)];
    //lineChart.frame = CGRectMake(0, 100, self.view.bounds.size.width, 300);
    [self.view addSubview:lineChart];
    lineChart.backgroundColor = [UIColor whiteColor];
    lineChart.yGridLinesColor = [UIColor grayColor];
    lineChart.showCoordinateAxis = YES; //是否显示坐标轴,默认NO
    //统一设置表格标签
    lineChart.xLabels = @[@"T1",@"T2",@"T3",@"T4",@"T5",@"T6",@"T7"];
    lineChart.yLabels = @[@"0",@"100℃",@"200℃",@"300℃",@"400℃"];
    lineChart.yLabelFormat = @"%.1f℃";
    
    
    //设置Y轴的刻度返回
    //    lineChart.yFixedValueMin = 0.0;
    //    lineChart.yFixedValueMax = 500;
    NSArray *line01_yArr = @[@120.3,@250,@200,@400];
    PNLineChartData *data = [[PNLineChartData alloc] init];
    data.color = PNRed;
    data.inflexionPointStyle = PNLineChartPointStyleCircle; //inflexionPoint:弯曲、拐点
    data.inflexionPointColor = PNGreen;
    data.itemCount = line01_yArr.count;
    data.getData = ^PNLineChartDataItem *(NSUInteger idx) {
        CGFloat yValue = [line01_yArr[idx] floatValue];
        return [PNLineChartDataItem dataItemWithY:yValue];
    };
    lineChart.chartData = @[data];
    [lineChart strokeChart];
}

- (void)drawBarChart {
    
}

- (void)drawPieChart {
    
}

@end
