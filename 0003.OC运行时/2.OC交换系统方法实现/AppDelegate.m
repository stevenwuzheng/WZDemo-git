//
//  AppDelegate.m
//  2.OC交换系统方法实现
//
//  Created by wujia121 on 17/5/29.
//  Copyright © 2017年 wujia121. All rights reserved.
//

#import "AppDelegate.h"
#import <objc/message.h>

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    //1.获取系统方法实现
    Method sysIMP = class_getInstanceMethod([self class], @selector(aaa));
    //2.获取自己写的方法实现
    Method wzIMP = class_getInstanceMethod([self class], @selector(bbb));
    //3.交换实现
    method_exchangeImplementations(wzIMP,sysIMP);
    
    //测试
    [self aaa];
    
    return YES;
}

- (void)aaa{
    NSLog(@"%s",__FUNCTION__);
}

-(void)bbb{
    NSLog(@"%s",__FUNCTION__);
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
