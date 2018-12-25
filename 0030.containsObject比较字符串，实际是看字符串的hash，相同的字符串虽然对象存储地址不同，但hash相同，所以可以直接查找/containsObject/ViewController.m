//
//  ViewController.m
//  containsObject
//
//  Created by wujia121 on 2018/12/15.
//  Copyright © 2018年 wujia121. All rights reserved.
//

#import "ViewController.h"
#import "Dog.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    Dog *dog = [Dog new];
    dog.name = [NSString stringWithFormat:@"xx"];
    
    Dog *dog1 = [Dog new];
    dog1.name = [NSMutableString stringWithFormat:@"xx"];
    
    
    NSArray *arr = @[
                     @"xx",
                     //[NSString stringWithFormat:@"xx"]
                     ];
    BOOL r1 = [arr containsObject:dog.name];
    BOOL r2 = [arr containsObject:dog1.name];
    
    NSString *str = @"1122334455667788"; //8Byte
    NSString *mac = [self getVisiableIDUUID:str];
    dog.mac = mac;
    
    NSMutableArray *arrM = [NSMutableArray new];
    //[arrM addObject:dog.mac];
    [arrM addObject:@"88:77:66:55:44:33"];
    
    dog1.mac = [self getVisiableIDUUID:@"1122334455667788"];
    BOOL r3 = [arrM containsObject:dog1.mac];
    
    NSLog(@"%s",__FUNCTION__);
}

- (NSString *)getVisiableIDUUID:(NSString *)peripheralIDUUID
{
    
    peripheralIDUUID = [peripheralIDUUID stringByReplacingOccurrencesOfString:@"-" withString:@""];
    peripheralIDUUID = [peripheralIDUUID stringByReplacingOccurrencesOfString:@"<" withString:@""];
    peripheralIDUUID = [peripheralIDUUID stringByReplacingOccurrencesOfString:@">" withString:@""];
    peripheralIDUUID = [peripheralIDUUID stringByReplacingOccurrencesOfString:@" " withString:@""];
    peripheralIDUUID = [peripheralIDUUID substringWithRange:NSMakeRange(4, 12)]; //地址截取
    peripheralIDUUID = [peripheralIDUUID uppercaseString];
    
    NSData *bytes = [peripheralIDUUID dataUsingEncoding:NSUTF8StringEncoding];
    Byte * myByte = (Byte *)[bytes bytes];
    
    NSMutableString *result = [[NSMutableString alloc] initWithString:@""];
    for (int i = 5; i >= 0; i--) {
        [result appendString:[NSString stringWithFormat:@"%@",[[NSString alloc] initWithBytes:&myByte[i*2] length:2 encoding:NSUTF8StringEncoding] ]];
    }
    
    for (int i = 1; i < 6; i++) {
        [result insertString:@":" atIndex:3*i-1 ];
    }
    // XCLog(@"地址：%@",result);
    return result;
}

/*
 NSArray 的 containObject：
 用来判断anObject是否在当前的NSArray中的时候，是通过调用isEqual:这个方法来判断的，
 即对于NSArray中的每个对象都会调用一次isEqual:
 如果返回YES自然就是说这个数组包含anObject。
 
 判断isEqual不是判断指针和地址，是看hash值是不是相同；相同的字符串虽然对象存储地址不同，但hash相同
 
 总结：
 containObject比较字符串，实际是看字符串的hash，相同的字符串虽然对象存储地址不同，但hash相同，所以可以直接查找
 */


@end
