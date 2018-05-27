//
//  ViewController.m
//  0010.GCD队列理解
//
//  Created by wujia121 on 2018/5/27.
//  Copyright © 2018年 steven. All rights reserved.
//

#import "ViewController.h"
#import "FMDatabaseQueue.h"

@interface ViewController ()

@property (strong, nonatomic) FMDatabaseQueue *dbQueue;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.dbQueue = [FMDatabaseQueue queue];
    //主线程来一个
    [self.dbQueue inDatabase:^{
        NSLog(@"---1:%@",[NSThread currentThread]);
    }];
    
    dispatch_sync(dispatch_get_global_queue(0, 0), ^{
        NSLog(@"---2:%@",[NSThread currentThread]);
    });
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        NSLog(@"---3:%@",[NSThread currentThread]);
    });
}


@end
