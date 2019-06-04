//
//  ViewController.m
//  Testaaaaa
//
//  Created by iot_wz on 2019/3/1.
//  Copyright © 2019 iot_iMac. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"---:%s",__FUNCTION__);
    dispatch_queue_t qqq = dispatch_queue_create("inet", DISPATCH_QUEUE_CONCURRENT);
    //dispatch_queue_t qqq = dispatch_queue_create("inet", DISPATCH_QUEUE_SERIAL);
    
    dispatch_async(qqq, ^{
        [self test1];
    });
    
    dispatch_async(qqq, ^{
        [self test2];
    });
    
    dispatch_async(qqq, ^{
        [self test3];
    });
}

- (void)test1 {
    NSLog(@"---111:%@",[NSThread currentThread]);
    for (int i = 0; i < 8000000; i++) {
        NSObject *obj = [NSObject new];
    }
    
    NSLog(@"---222:%@",[NSThread currentThread]);
}


- (void)test2 {
    NSLog(@"---333:%@",[NSThread currentThread]);
    sleep(3);
    NSLog(@"---444:%@",[NSThread currentThread]);
}

- (void)test3 {
    NSLog(@"---555:%@",[NSThread currentThread]);
    sleep(5);
    NSLog(@"---666:%@",[NSThread currentThread]);
}


@end

/* dispath_asyn + 并发队列
 2019-03-02 18:18:37.713462+0800 Testaaaaa[97401:1202964] ---:-[ViewController touchesBegan:withEvent:]
 2019-03-02 18:18:37.713719+0800 Testaaaaa[97401:1203071] ---111:<NSThread: 0x6000013a2540>{number = 3, name = (null)}
 2019-03-02 18:18:37.713720+0800 Testaaaaa[97401:1203072] ---333:<NSThread: 0x6000013be340>{number = 4, name = (null)}
 2019-03-02 18:18:37.713743+0800 Testaaaaa[97401:1203073] ---555:<NSThread: 0x6000013bad40>{number = 5, name = (null)}
 2019-03-02 18:18:38.858305+0800 Testaaaaa[97401:1203071] ---222:<NSThread: 0x6000013a2540>{number = 3, name = (null)}
 2019-03-02 18:18:40.716069+0800 Testaaaaa[97401:1203072] ---444:<NSThread: 0x6000013be340>{number = 4, name = (null)}
 2019-03-02 18:18:42.716188+0800 Testaaaaa[97401:1203073] ---666:<NSThread: 0x6000013bad40>{number = 5, name = (null)}
 */

/* dispath_asyn + 串行队列
 2019-03-02 18:17:44.162425+0800 Testaaaaa[97380:1200707] ---:-[ViewController touchesBegan:withEvent:]
 2019-03-02 18:17:44.162642+0800 Testaaaaa[97380:1200798] ---111:<NSThread: 0x600001ca6500>{number = 3, name = (null)}
 2019-03-02 18:17:45.303021+0800 Testaaaaa[97380:1200798] ---222:<NSThread: 0x600001ca6500>{number = 3, name = (null)}
 2019-03-02 18:17:45.303202+0800 Testaaaaa[97380:1200798] ---333:<NSThread: 0x600001ca6500>{number = 3, name = (null)}
 2019-03-02 18:17:48.308498+0800 Testaaaaa[97380:1200798] ---444:<NSThread: 0x600001ca6500>{number = 3, name = (null)}
 2019-03-02 18:17:48.308664+0800 Testaaaaa[97380:1200798] ---555:<NSThread: 0x600001ca6500>{number = 3, name = (null)}
 2019-03-02 18:17:53.313639+0800 Testaaaaa[97380:1200798] ---666:<NSThread: 0x600001ca6500>{number = 3, name = (null)}
 */
