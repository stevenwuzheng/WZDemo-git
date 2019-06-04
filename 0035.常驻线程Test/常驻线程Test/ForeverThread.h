//
//  MyThread.h
//  GoodType
//
//  Created by iot_imac on 2019/1/25.
//  Copyright © 2019 Senchor. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ForeverThread : NSObject

+ (instancetype)shared;
@property (nonatomic, strong) NSThread *myThread;

@property (nonatomic, assign) dispatch_queue_t myQueue;


@end

NS_ASSUME_NONNULL_END
