//
//  ViewController.m
//  TestArray
//
//  Created by iot_iMac on 2018/11/27.
//  Copyright © 2018年 iot_iMac. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSObject *obj1 = [NSObject new];
    NSObject *obj2 = [NSObject new];
    NSObject *obj3 = [NSObject new];
    NSLog(@"---obj1自身栈地址:%p obj1中保存堆对象的地址:%@",&obj1,obj1);
    NSLog(@"---obj2自身栈地址:%p obj2中保存堆对象的地址:%@",&obj2,obj2);
    NSLog(@"---obj3自身栈地址:%p obj3中保存堆对象的地址:%@",&obj3,obj3);
    [self logObj:obj1 str:@"obj1"];//OC方法调用是值传递，故此处传入的是obj1中的地址，故想要在-logObj:str:方法内部打印出obj1的栈地址是不可能的，除非传入&obj1才可以
    [self logObj:obj2 str:@"obj2"];
    [self logObj:obj3 str:@"obj3"];
    
    NSMutableArray *arrM = [NSMutableArray arrayWithCapacity:3];
    [arrM addObject:obj1]; //把obj1中存储的堆中的那个地址(值传递)给数组，之后想要修改数组的内容就必须通过arrM[0]、arrM[1]=xx对象(堆内存地址)，而直接修改obj这个栈中变量里存储的值为nil，对原来可变数组没有任何影响。
    [arrM addObject:obj2]; //值传递：将obj2指针变量保存的地址传给arrM[1]
    [arrM addObject:obj3];
    NSLog(@"---arrM自身栈地址:%p arrM中保存堆对象的地址:%p arrM中保存堆对象的内容:%@",&arrM,arrM,arrM);//%@占位符就是调用堆中的某个对象的description方法,%p是打印地址(指针变量or取地址普通变量)使用的占位符，它代表的数比较大，打印地址用%d也行，就怕不够用。
    
    #pragma mark ============ 测试可变数组的copy和mutableCopy ==============
    NSArray *arr1 = arrM.copy;
    NSLog(@"---arr1自身栈地址:%p arr1中保存堆对象的地址:%p arr1中保存堆对象的内容:%@",&arr1,arr1,arr1);
    NSArray *arr2 = arrM.mutableCopy;
    NSLog(@"---arr2自身栈地址:%p arr2中保存堆对象的地址:%p arr2中保存堆对象的内容:%@",&arr2,arr2,arr2);
    
    #pragma mark ============ 测试将obj1变为nil，看看arrM会不会变化 ==============
    obj1 = nil; //将栈中obj1里存储的值由原来堆中对象的地址，改为NULL，这对数组没有啥影响
    NSLog(@"---arrM自身栈地址:%p arrM中保存堆对象的地址:%p arrM中保存堆对象的内容:%@",&arrM,arrM,arrM); //但是可变数组还是装着obj1最开始传入(地址值传递)的那块内存的地址
    
    #pragma mark ============ 想要修改可变数组中的值，只能通过如下2种方法，不能妄图通过obj1 ==============
    arrM[0] = nil;//Null passed to a callee that requires a non-null argument
    [arrM replaceObjectAtIndex:0 withObject:nil]; //充分证明数组中元素不能被加入或修改为NULL指针
    //崩溃：OC方法中限定为nonnull的参数如何传入nil，一定会闪退：-[__NSArrayM setObject:atIndexedSubscript:]: object cannot be nil'

    
}


- (void)logObj:(id)obj str:(NSString *)objStr {
    //OC方法调用是值传递，此处只能打印出函数内部变量obj在栈中自身地址，故不管外面传入的obj是obj1,obj2,obj3，还是arrM，都是将obj1/obj2等指针变量的内容传给obj这个指针变量接收而已，此处打印出obj自身地址永远都不变。
    NSLog(@"---%@自身地址:%p %@所指堆中对象地址:%@",objStr,&obj,objStr,obj);
}


@end

/* 控制台打印结果：
 
 2018-11-27 14:16:20.444500+0800 TestArray[7762:525743] ---obj1自身栈地址:0x7ffee4c96a58 obj1中保存堆对象的地址:<NSObject: 0x6080000062c0>
 2018-11-27 14:16:20.444625+0800 TestArray[7762:525743] ---obj2自身栈地址:0x7ffee4c96a50 obj2中保存堆对象的地址:<NSObject: 0x6080000063b0>
 2018-11-27 14:16:20.444711+0800 TestArray[7762:525743] ---obj3自身栈地址:0x7ffee4c96a48 obj3中保存堆对象的地址:<NSObject: 0x6080000063a0>
 2018-11-27 14:16:20.444806+0800 TestArray[7762:525743] ---obj1自身地址:0x7ffee4c969b8 obj1所指堆中对象地址:<NSObject: 0x6080000062c0>    //自身地址其实是方法内部局部变量obj的栈地址
 2018-11-27 14:16:20.444903+0800 TestArray[7762:525743] ---obj2自身地址:0x7ffee4c969b8 obj2所指堆中对象地址:<NSObject: 0x6080000063b0>    //自身地址其实是方法内部局部变量obj的栈地址
 2018-11-27 14:16:20.444968+0800 TestArray[7762:525743] ---obj3自身地址:0x7ffee4c969b8 obj3所指堆中对象地址:<NSObject: 0x6080000063a0>    //自身地址其实是方法内部局部变量obj的栈地址
 2018-11-27 14:16:20.445068+0800 TestArray[7762:525743] ---arrM自身栈地址:0x7ffee4c96a40 arrM中保存堆对象的地址:0x608000244a10 arrM中保存堆对象的内容:(
 "<NSObject: 0x6080000062c0>",
 "<NSObject: 0x6080000063b0>",
 "<NSObject: 0x6080000063a0>"
 )
 2018-11-27 14:16:20.445163+0800 TestArray[7762:525743] ---arr1自身栈地址:0x7ffee4c96a38 arr1中保存堆对象的地址:0x608000244800 arr1中保存堆对象的内容:(
 "<NSObject: 0x6080000062c0>",
 "<NSObject: 0x6080000063b0>",
 "<NSObject: 0x6080000063a0>"
 )
 2018-11-27 14:16:20.445246+0800 TestArray[7762:525743] ---arr2自身栈地址:0x7ffee4c96a30 arr2中保存堆对象的地址:0x6080002447a0 arr2中保存堆对象的内容:(
 "<NSObject: 0x6080000062c0>",
 "<NSObject: 0x6080000063b0>",
 "<NSObject: 0x6080000063a0>"
 )
 2018-11-27 14:16:20.492289+0800 TestArray[7762:525743] ---arrM自身栈地址:0x7ffee4c96a40 arrM中保存堆对象的地址:0x608000244a10 arrM中保存堆对象的内容:(
 "<NSObject: 0x6080000062c0>",
 "<NSObject: 0x6080000063b0>",
 "<NSObject: 0x6080000063a0>"
 )
 2018-11-27 14:16:20.496568+0800 TestArray[7762:525743] *** Terminating app due to uncaught exception 'NSInvalidArgumentException', reason: '*** -[__NSArrayM setObject:atIndexedSubscript:]: object cannot be nil'
 *** First throw call stack:
 (
 0   CoreFoundation                      0x000000010c1d11e6 __exceptionPreprocess + 294
 1   libobjc.A.dylib                     0x000000010b866031 objc_exception_throw + 48
 2   CoreFoundation                      0x000000010c2110bc _CFThrowFormattedException + 194
 3   CoreFoundation                      0x000000010c203710 -[__NSArrayM setObject:atIndexedSubscript:] + 544
 4   TestArray                           0x000000010af6637f -[ViewController viewDidLoad] + 751
 5   UIKit                               0x000000010c7f2131 -[UIViewController loadViewIfRequired] + 1215
 6   UIKit                               0x000000010c7f2574 -[UIViewController view] + 27
 7   UIKit                               0x000000010c6c0123 -[UIWindow addRootViewControllerViewIfPossible] + 122
 8   UIKit                               0x000000010c6c0834 -[UIWindow _setHidden:forced:] + 294
 9   UIKit                               0x000000010c6d35cc -[UIWindow makeKeyAndVisible] + 42
 10  UIKit                               0x000000010c6473da -[UIApplication _callInitializationDelegatesForMainScene:transitionContext:] + 4739
 11  UIKit                               0x000000010c64c5cb -[UIApplication _runWithMainScene:transitionContext:completion:] + 1677
 12  UIKit                               0x000000010ca0ef7e __111-[__UICanvasLifecycleMonitor_Compatability _scheduleFirstCommitForScene:transition:firstActivation:completion:]_block_invoke + 866
 13  UIKit                               0x000000010cde1a39 +[_UICanvas _enqueuePostSettingUpdateTransactionBlock:] + 153
 14  UIKit                               0x000000010ca0ebba -[__UICanvasLifecycleMonitor_Compatability _scheduleFirstCommitForScene:transition:firstActivation:completion:] + 236
 15  UIKit                               0x000000010ca0f3db -[__UICanvasLifecycleMonitor_Compatability activateEventsOnly:withContext:completion:] + 675
 16  UIKit                               0x000000010d380614 __82-[_UIApplicationCanvas _transitionLifecycleStateWithTransitionContext:completion:]_block_invoke + 299
 17  UIKit                               0x000000010d3804ae -[_UIApplicationCanvas _transitionLifecycleStateWithTransitionContext:completion:] + 433
 18  UIKit                               0x000000010d06475d __125-[_UICanvasLifecycleSettingsDiffAction performActionsForCanvas:withUpdatedScene:settingsDiff:fromSettings:transitionContext:]_block_invoke + 221
 19  UIKit                               0x000000010d25f4b7 _performActionsWithDelayForTransitionContext + 100
 20  UIKit                               0x000000010d064627 -[_UICanvasLifecycleSettingsDiffAction performActionsForCanvas:withUpdatedScene:settingsDiff:fromSettings:transitionContext:] + 223
 21  UIKit                               0x000000010cde10e0 -[_UICanvas scene:didUpdateWithDiff:transitionContext:completion:] + 392
 22  UIKit                               0x000000010c64aeac -[UIApplication workspace:didCreateScene:withTransitionContext:completion:] + 515
 23  UIKit                               0x000000010cc1dbcb -[UIApplicationSceneClientAgent scene:didInitializeWithEvent:completion:] + 361
 24  FrontBoardServices                  0x0000000110a7b2f3 -[FBSSceneImpl _didCreateWithTransitionContext:completion:] + 331
 25  FrontBoardServices                  0x0000000110a83cfa __56-[FBSWorkspace client:handleCreateScene:withCompletion:]_block_invoke_2 + 225
 26  libdispatch.dylib                   0x000000010fbb17ec _dispatch_client_callout + 8
 27  libdispatch.dylib                   0x000000010fbb6db8 _dispatch_block_invoke_direct + 592
 28  FrontBoardServices                  0x0000000110aaf470 __FBSSERIALQUEUE_IS_CALLING_OUT_TO_A_BLOCK__ + 24
 29  FrontBoardServices                  0x0000000110aaf12e -[FBSSerialQueue _performNext] + 439
 30  FrontBoardServices                  0x0000000110aaf68e -[FBSSerialQueue _performNextFromRunLoopSource] + 45
 31  CoreFoundation                      0x000000010c173bb1 __CFRUNLOOP_IS_CALLING_OUT_TO_A_SOURCE0_PERFORM_FUNCTION__ + 17
 32  CoreFoundation                      0x000000010c1584af __CFRunLoopDoSources0 + 271
 33  CoreFoundation                      0x000000010c157a6f __CFRunLoopRun + 1263
 34  CoreFoundation                      0x000000010c15730b CFRunLoopRunSpecific + 635
 35  GraphicsServices                    0x0000000111344a73 GSEventRunModal + 62
 36  UIKit                               0x000000010c64e057 UIApplicationMain + 159
 37  TestArray                           0x000000010af6650f main + 111
 38  libdyld.dylib                       0x000000010fc2e955 start + 1
 39  ???                                 0x0000000000000001 0x0 + 1
 )
 libc++abi.dylib: terminating with uncaught exception of type NSException
 
 
 */
