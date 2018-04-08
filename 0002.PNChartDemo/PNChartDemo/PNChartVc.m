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
    
    PNLineChart *lineChart = [[PNLineChart alloc] init];
    lineChart.frame = self.view.bounds;
    [self.view addSubview:lineChart];
    
    lineChart.chartCavanWidth = self.view.bounds.size.width;
    lineChart.chartCavanHeight = lineChart.chartCavanWidth;
    lineChart.yFixedValueMin = 5000;
    lineChart.yFixedValueMax = 10000;
    
    lineChart.xLabels = @[@"2015",@"2016",@"2017",@"2018"];
    
    NSArray *dataArr = @[@5000,@6000,@7000,@8000];
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
