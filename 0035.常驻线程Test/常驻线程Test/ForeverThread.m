//
//  MyThread.m
//  GoodType
//
//  Created by iot_imac on 2019/1/25.
//  Copyright © 2019 Senchor. All rights reserved.
//

#import "ForeverThread.h"

@implementation ForeverThread

+ (instancetype)shared {
    static self *_instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[self alloc] init];
    });
    return _instance;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _thread = [[NSThread alloc] initWithTarget:self selector:@selector(run) object:nil];
        
        _myQueue = dispatch_queue_create("MySqlQueue", DISPATCH_QUEUE_SERIAL);
        dispatch_async(_myQueue, ^{
            
            //[[NSRunLoop currentRunLoop] addPort:[NSPort port] forMode:(NSRunLoopCommonModes)];//永不退出,和定时器等效
            [NSTimer scheduledTimerWithTimeInterval:1 repeats:YES block:^(NSTimer * _Nonnull timer) {
                NSLog(@"---子线程定时器活着:%@ 线程:%@",timer,[NSThread currentThread]);
            }];
            
            [[NSRunLoop currentRunLoop] run]; //GCD队列只要有任务要执行，就不会被销毁；因为使用的是dispatch_async，故会在主线程之外开启一个新线程，执行port事件；port就像一个永不退出的定时器，故runloop永远不会退出；故该block任务一直执行不完，故能保证_myQueue永不被销毁
        });
    }
    return self;
}

- (void)run {
    
    @autoreleasepool {
        
        //[[NSRunLoop currentRunLoop] addPort:[NSPort port] forMode:(NSRunLoopCommonModes)]; //永不退出,和定时器等效
        [NSTimer scheduledTimerWithTimeInterval:1 repeats:YES block:^(NSTimer * _Nonnull timer) {
            NSLog(@"---子线程定时器活着:%@ 线程:%@",timer,[NSThread currentThread]);
        }];
        [[NSRunLoop currentRunLoop] run];
    }//NSRunLoop类似一个while(1)循环，只有NSRunLoop退出run，线程才会被销毁，自动释放池才会释放

}

- (void)target:(id)target performSelector:(SEL)aSelector withObject:(nullable id)arg {
    [target performSelector:aSelector onThread:self.myThread withObject:arg waitUntilDone:NO];
}


@end
