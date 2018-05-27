//
//  FMDatabaseQueue.h
//  0010.GCD队列理解
//
//  Created by wujia121 on 2018/5/27.
//  Copyright © 2018年 steven. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface FMDatabaseQueue : NSObject

+(instancetype)queue;

-(void)inDatabase:(void(^)(void))inQueueBlock ;

@end
