//
//  AppDelegate+Log.h
//  导入项目的所有OC分类都会被load-其中方法也会生效
//
//  Created by iot_iMac on 2018/4/17.
//  Copyright © 2018年 iot_iMac. All rights reserved.
//


#import "AppDelegate.h" //OC所有导入头文件均只是为了方便Xcode进行代码提示，让clang编译器不报错；此处导入"AppDelegate.h"是为了在使用@interface AppDelegate (Log)不提示找不到AppDelegate这个类而已

@interface AppDelegate (Log)

-(void)printAppInfo;

@end
