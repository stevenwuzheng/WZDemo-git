//
//  ViewController.m
//  二进制
//
//  Created by wujia121 on 2018/9/21.
//  Copyright © 2018年 wujia121. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, copy) NSString *jsonPath;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    logSize();
    
    //计算机内存中采用Unicode(2Byte),写入文件或浏览器显示都是用UTF8(1~4Byte),文件test.txt中文本为12个英文字符,根据UTF8编码,其大小应为12Byte
    self.jsonPath = [[NSBundle mainBundle] pathForResource:@"test.txt" ofType:nil];
    
    [self test1];//Byte就是char,占用1B,在C中char占1B,short为2B,int为4B,long为8B
}


- (void)test1 {

    //NSData and its mutable subclass NSMutableData provide data objects, or object-oriented wrappers for byte buffers.
    //NSData和NSMutableData封装byte buffers(1Byte大小的内存缓冲块)
    NSData *data = [NSData dataWithContentsOfFile:self.jsonPath];
    NSLog(@"---data:%@",data);
    
    NSUInteger bytesNum = data.length; //byte 的个数
    NSLog(@"---data.length: %zd",bytesNum);
    
    //data.bytes ：return A const pointer to the data object's contents(bytes). 返回一个不可变的void *指针，由于data里面装着一个个的byte，故指针的类型即Byte * ，从这个data.bytes指针开始向后data.length个byte结束。
    Byte *p = (Byte *)data.bytes; //使用可变指针p来接收，所有的可变指针都可以进行p[0]、p[1]、p[n]这样的操作，意思是取出第一个、第二个、第三个p地址中的值
    
    NSLog(@"---p:%p  &p[0]: %p  p[0]: %0x",p, &p[0], p[0]); //打印p中存的地址，其实就是p[0]的地址&p[0],p[0]写法是取出&p[0]这个地址(p中存储的就是&p[0])中存储的数据: 具体的Byte值
    //遍历打印
    for (int i = 0; i < bytesNum; i++) {
        NSLog(@"---p+%d:%p  &p[%d]:%p  p[%d]:%0x  *(p+%d):%0x",i,p+i, i,&p[i],  i,p[i],  i,*(p+i));

    }

    /*
     补习C语言：
     任何可变指针(不带const修饰的)，都可以执行 p+i 和 p[i] 操作
     》p 中存储的地址为 &p[0]
     》p+i 是将p指针位置从&p[0], 向后移动 i * sizeof(指针类型) = xx Bytes，
     》p[i] 是取出 &p[i] 开始，往后连续 1 * sizeof(指针类型) = n Bytes 个存储空间中保存的数值。
     》p[i] 等价 *(p+i)
     */
    

}



void logSize() {
    printf("\n-------");
    printf("\n sizeof(Byte) : %lu,\n sizeof(char) : %lu,\n sizeof(short) : %lu,\n sizeof(int) : %lu,\n sizeof(long) : %lu,\n sizeof(long long) : %lu,\n sizeof(float) : %lu,\n sizeof(double) : %lu,\n sizeof(char *) : %lu,\n sizeof(double *) : %lu" ,
           sizeof(Byte),
           sizeof(char),
           sizeof(short),
           sizeof(int),
           sizeof(long),
           sizeof(long long),
           sizeof(float),
           sizeof(double),
           sizeof(char *),
           sizeof(double *)
           );
    printf("\n-------\n");
    /*
     -------
     sizeof(Byte) : 1,
     sizeof(char) : 1,
     sizeof(short) : 2,
     sizeof(int) : 4,
     sizeof(long) : 8,
     sizeof(long long) : 8,
     sizeof(float) : 4,
     sizeof(double) : 8,
     sizeof(char *) : 8,
     sizeof(double *) : 8
     -------
     */
}


@end
