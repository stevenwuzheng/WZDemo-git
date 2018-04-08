//
//  ViewController.m
//  1.OC方法调用底层发送消息
//
//  Created by wujia121 on 17/5/28.
//  Copyright © 2017年 wujia121. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"
#import <objc/message.h>

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    /*
     1.OC方法调用的底层都是让对象发送消息objc_msgSend。
     
     2.使用消息机制前提，必须导入#import <objc/message.h>
     */
    

    Person *p = [[Person alloc] init];
    [p eat];  //等价下句
    objc_msgSend(p, @selector(eat)); //等价上句
    
    
    //类方法
    [Person run];
    objc_msgSend([Person class], @selector(run));
}



@end
