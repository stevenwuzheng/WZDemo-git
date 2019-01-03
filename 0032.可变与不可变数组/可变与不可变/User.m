//
//  User.m
//  可变与不可变
//
//  Created by iot_imac on 2018/12/6.
//  Copyright © 2018年 iot_iMac. All rights reserved.
//

#import "User.h"

@implementation User

- (NSString *)description
{
    return [NSString stringWithFormat:@"%p:%@",self, _name];
}

@end
