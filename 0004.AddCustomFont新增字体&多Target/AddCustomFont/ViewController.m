//
//  ViewController.m
//  AddCustomFont
//
//  Created by iot_iMac on 2018/4/14.
//  Copyright © 2018年 iot_iMac. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self logAllSystemFontsName];
}


- (void)logAllSystemFontsName {
    
    UILabel *lbl = [UILabel new];
    lbl.textColor = [UIColor redColor];
    lbl.textAlignment = NSTextAlignmentCenter;
    lbl.numberOfLines = 0;
    lbl.frame = self.view.bounds;
    [self.view addSubview:lbl];
    
#if CUSTOM_AddCustomFont
    NSLog(@"---------------- 以下是iOS系统提供78种字体 -----------------");
    lbl.text = @"已经在Xcode控制台打印了\n当前iOS系统提供的所有字体集&字体";
    //lbl.font = [UIFont fontWithName:@"Digital-7Mono" size:18];
    
#elif CUSTOM_AddMyOwnFont
    NSLog(@"---------------- 系统78种字体 + digital-7字体 -----------------");
    lbl.text = @"我是Digital-7字体集: Digital-7Mono字体";
    lbl.font = [UIFont fontWithName:@"Digital-7Mono" size:18];
#endif
    
    
    //返回当前iOS系统已经安装的所有"字体集"名称
    NSArray <NSString *> *fontFamilys = [UIFont familyNames];
    [fontFamilys enumerateObjectsUsingBlock:^(NSString * _Nonnull familyName, NSUInteger idx, BOOL * _Nonnull stop) {
        
        NSLog(@"ios系统字体集-%03zd: %@ <字体集FamilyName>",idx,familyName);
        //打印每种字体集包含的font字体名称
        NSArray *fontArrForFamily = [UIFont fontNamesForFamilyName:familyName];
        for (NSString *fontName in fontArrForFamily) {
            NSLog(@"---------------: %@",fontName);
        }

    }];
    
    
}


@end





