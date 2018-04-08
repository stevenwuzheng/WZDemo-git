//
//  Person.m
//  OC运行时
//
//  Created by wujia121 on 17/5/28.
//  Copyright © 2017年 wujia121. All rights reserved.
//

#import "Person.h"

@implementation Person

- (void)eat {
    NSLog(@"person的对象方法-eat被调用");
}

+ (void)run {
    NSLog(@"person的类方法+run被调用");
}

@end
