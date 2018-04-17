//
//  AppDelegate.m
//  导入项目的所有OC分类都会被load-其中方法也会生效
//
//  Created by iot_iMac on 2018/4/17.
//  Copyright © 2018年 iot_iMac. All rights reserved.
//

#import "AppDelegate.h"

/*
 一、使用分类的常用做法:
    1：创建分类.h和.m，在.h中声明方法，在.m中实现方法
    2：在需要使用的地方导入.h
    3：在代码中调用[xxobj xxmethod]
二、使用分类的高级做法:
    1.只新建一个.m文件，在其中导入原类.h，在@implementation xxClass(Log)  @end之间写入方法的实现
    2.在需要使用的地方直接[xxobj performSelector:]
 */
#import "AppDelegate+Log.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    [self printAppInfo];
    
    [self performSelector:@selector(LogAppInfo)];
    
    [@[] performSelector:@selector(logMyArray)];
    
    
    
    
    NSArray *arr = @[@1,@2,@3];
    
    id obj = [arr objectAtIndex:1]; //用分类覆盖原NSArray的方法：不生效 Category is implementing a method which will also be implemented by its primary class
    
    
    return YES;
}



@end
