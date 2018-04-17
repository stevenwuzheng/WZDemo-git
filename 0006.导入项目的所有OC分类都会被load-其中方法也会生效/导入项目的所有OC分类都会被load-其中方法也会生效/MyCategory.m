//
//  MyCategory.m
//  导入项目的所有OC分类都会被load-其中方法也会生效
//
//  Created by iot_iMac on 2018/4/17.
//  Copyright © 2018年 iot_iMac. All rights reserved.
//


//#import "MyCategory.h" //所有的OC头文件都没什么乱用

//OC类的.h文件其实作用仅仅是让编译器不报错，另外就是导入头文件后程序员写代码会有提示而已，证据:在 Xcode -> build phases -> compile sources 中可以看到加入编译和链接的只有.m文件，不会有.h文件

//其实OC所有的类或分类都可以不要.h，直接使用performSelector来调用.m中的方法就可以。

//因此，OC并不要求每个类都必须有一个单独的.h和.m文件，可以将多个类的.h写入到同一个MyClass.h文件中，同时将他们的.m实现写到MyClass.m中；

//我们有时会新建一个分类，作用仅仅是为了重写原类中的某个方法；此时可以只在.m中导入原类的.h，就可以在.m中使用该类名了。然后新建分类@implementation中重写方法。分类是在运行时与原类的.m中方法实现进行合并的(合并的规则是分类和原类存在同名方法，分类优先)

#import "AppDelegate.h" //导入该文件,是为了@implementation AppDelegate(log)时不报错

@implementation AppDelegate(log)

-(void)LogAppInfo {
    NSLog((@"[文件名:%@]\n" "[函数名:%s]\n" "[行号:%d] \n"), [NSString stringWithFormat:@"%s",__FILE__].lastPathComponent, __FUNCTION__, __LINE__);
}

@end


#import <Foundation/NSArray.h>

@implementation NSArray(log)

-(void)logMyArray {
    NSLog((@"[文件名:%@]\n" "[函数名:%s]\n" "[行号:%d] \n"), [NSString stringWithFormat:@"%s",__FILE__].lastPathComponent, __FUNCTION__, __LINE__);
}

//重写NSArray的count方法，会影响整个项目中的NSArray及其子类
-(id)objectAtIndex:(NSUInteger)index {
    NSLog(@"整个项目的NSArray的objectAtIndex方法均被分类覆盖改写了,都会返回nil");
    return nil; //不生效Category is implementing a method which will also be implemented by its primary class
}

@end
