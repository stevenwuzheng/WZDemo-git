//
//  FMDatabaseQueue.m
//  0010.GCD队列理解
//
//  Created by wujia121 on 2018/5/27.
//  Copyright © 2018年 steven. All rights reserved.
//

#import "FMDatabaseQueue.h"

@interface FMDatabaseQueue()
{
    dispatch_queue_t _serialQ;
}


@end

@implementation FMDatabaseQueue

+(instancetype)queue {
    return [[self alloc] init];
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _serialQ = dispatch_queue_create("com.inet.serialQueue", DISPATCH_QUEUE_SERIAL);
    }
    return self;
}

-(void)inDatabase:(void(^)(void))inQueueBlock {
    
    dispatch_sync(_serialQ, ^{
        if(inQueueBlock) inQueueBlock();
    });
    
}

@end
