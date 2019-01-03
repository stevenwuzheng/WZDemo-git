//
//  ViewController.m
//  可变与不可变
//
//  Created by iot_imac on 2018/12/6.
//  Copyright © 2018年 iot_iMac. All rights reserved.
//

#import "ViewController.h"
#import "User.h"

@interface ViewController ()

@property (nonatomic, strong) NSArray *arr;
@property (nonatomic, strong) NSMutableArray *arrM;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    User *u1 = [User new];
    u1.name = @"u1";
    
    User *u2 = [User new];
    u2.name = @"u2";
    
    User *u3 = [User new];
    u3.name = @"u3";
    
    _arr = @[u1,u2,u3];

    _arrM = [NSMutableArray new];
    [_arrM addObject:u1];
    [_arrM addObject:u2];
    [_arrM addObject:u3];
    NSLog(@"0---arr:%@ \n arrM:%@",_arr,_arrM);
    
    for (User *usr in self.arr) {
        usr.name = @"zhang_san";
    }

    NSLog(@"1---arr:%@ \n arrM:%@",_arr,_arrM);
    
    [_arrM removeObject:u3];
    User *obj = _arrM[1];
    obj.name = @"li_si";
    NSLog(@"2---arr:%@ \n arrM:%@",_arr,_arrM);
    
}

@end

/*
 2018-12-06 17:54:17.066657+0800 可变与不可变[10533:1212477] 0---arr:(
 "0x608000013b80:u1",
 "0x608000013bc0:u2",
 "0x608000013bd0:u3"
 )
 arrM:(
 "0x608000013b80:u1",
 "0x608000013bc0:u2",
 "0x608000013bd0:u3"
 )
 2018-12-06 17:54:17.067063+0800 可变与不可变[10533:1212477] 1---arr:(
 "0x608000013b80:zhang_san",
 "0x608000013bc0:zhang_san",
 "0x608000013bd0:zhang_san"
 )
 arrM:(
 "0x608000013b80:zhang_san",
 "0x608000013bc0:zhang_san",
 "0x608000013bd0:zhang_san"
 )
 2018-12-06 17:54:17.067265+0800 可变与不可变[10533:1212477] 2---arr:(
 "0x608000013b80:zhang_san",
 "0x608000013bc0:li_si",
 "0x608000013bd0:zhang_san"
 )
 arrM:(
 "0x608000013b80:zhang_san",
 "0x608000013bc0:li_si"
 )
 */
