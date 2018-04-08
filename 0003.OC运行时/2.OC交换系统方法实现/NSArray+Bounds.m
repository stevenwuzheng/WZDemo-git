//
//  NSArray+Bounds.m
//  OC运行时
//
//  Created by wujia121 on 17/5/29.
//  Copyright © 2017年 wujia121. All rights reserved.
//

#import "NSArray+Bounds.h"
#import <objc/runtime.h>

@implementation NSArray (Bounds)

+ (void)load {
    
    //交换类的方法的实现，故class开头
    
    //1.获取系统方法实现
    //Method sysIMP = class_getInstanceMethod([NSArray class], @selector(objectAtIndex:));
    Method sysIMP = class_getInstanceMethod(NSClassFromString(@"__NSArrayI"), @selector(objectAtIndex:));
    //2.获取自己写的方法实现
    //Method wzIMP = class_getInstanceMethod([NSArray class], @selector(wz_objectAtIndex:));
    Method wzIMP = class_getInstanceMethod(NSClassFromString(@"__NSArrayI"), @selector(wz_objectAtIndex:));
    //3.交换实现
    method_exchangeImplementations(sysIMP, wzIMP);
    
}

//从数组中取值各种写法都会调用下面这个方法，故可以统一拦截，防止越界;但是NSArray在运行时类并不是[NSArray class];而是根据ios系统不同而不同
//向数组中存入对象的方法很多，也不统一，故无法统一拦截，防止存入nil的情况
- (id)wz_objectAtIndex:(NSUInteger)index {
    
    if (index >= self.count) {
        NSLog(@"数组越界index:%zd > 数组count:%zd",index, self.count);
        return nil;
    }

    return [self wz_objectAtIndex:index]; //在+load中已交换,此处是调用系统方法
}



@end

