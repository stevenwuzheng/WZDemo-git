//
//  ViewController.m
//  NSData-Byte-Test
//
//  Created by iot_iMac on 2018/5/3.
//  Copyright © 2018年 iot_iMac. All rights reserved.
//

#import "ViewController.h"
#import <string.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self test1];
}


- (void)test1 {
    //NSData *data = [NSData new];
    //char s[] = {0x01,0x02,0x03,0x04,0x05}; //内存中就是{0x01,0x02,0x03,0x04,0x05}
    //char s[] = "12345"; //内存中就是{0x31,0x32,0x33,0x34,0x35}  //字符串常量被拷贝到栈内存中
    char *s = "12345"; //内存中就是{0x31,0x32,0x33,0x34,0x35}   //字符串常量仍在运行时的常量区，没有被拷贝
    //ASCLL: "1":0x31,"2":0x32,"5":0x35  数字ASCLL: 1:0x01, 2:0x02, 5:0x05 参考http://ascii.911cha.com/?year=1
    //安装程序时，在内存的字符常量区就会分配
    unsigned long slen = strlen(s); //C语言获取字符串长度
    NSData *data = [NSData dataWithBytes:s length:slen]; //const void * 说明是C语言常量指针，数组名刚好符合
    NSUInteger byte_num = data.length; //data中包含的Byte个数
    const void *p1 = data.bytes; //NSData由很多个连续的Byte组成，这里返回第一个Byte的地址(headP指针)
    const Byte *p2 = (Byte *)data.bytes; //typedef UInt8  Byte;  //typedef unsigned char  UInt8;
    const unsigned char *p3 = data.bytes; //void *指针可以被自动转为任意C语言其他指针
    
    [self logBytes:p1 length:byte_num];
    [self logBytes:p2 length:byte_num];
    [self logBytes:p3 length:byte_num];
}

//C语言char * 类型的指针，可以直接被当做数组使用； 指向C数组的指针，可以用来操作数组。 数组名是个常量指针,保存着数组第一个元素的地址；data.bytes返回的就是一个Byte数组的地址(第一个元素的地址)
- (void)logBytes:(Byte[])headP length:(NSUInteger)len {
    printf("\n--------------");
    for (int i = 0; i < len-1; i++) {
        printf("%02x",headP[i]); //printf和NSLog一样,底层被重载过,作用都是将你传入的常量、变量、对象等转换为字符串输出在控制台，只不过打印不同的类型，需要使用不同的占位符，因为C、OC都没有方法重载，只能根据占位符来区分采用哪种格式打印。
    }
    printf("--------------\n");
}

@end

/*
 A pointer to the data object's contents.
 //NSData由很多个连续的Byte组成，这里返回第一个Byte的地址(指针)
 
 If the length of the NSData object is 0, this property returns nil.
 For an immutable data object, the returned pointer is valid until the data object is deallocated. For a mutable data object, the returned pointer is valid until the data object is deallocated or the data is mutated.
 
 如果NSData对象.length为0，则此属性返回的指针为nil。
 对于一个不可变的数据对象，返回的指针是有效的，直到数据对象被释放。
 对于可变数据对象，返回的指针是有效的，直到数据对象被解除分配或数据发生变化。
 */


/*
 C语言中使用指针与数组的区别：
 在c语言中，指针和数组名都表示地址，但两者却有很大的不同之处，对于初学者来说一定要弄清楚两者的区别。
 C语言的字符串其实就是以'\0'字符结尾的char型数组，使用字符串操作函数需要引用头文件<string.h>。
 c语言中%c格式符表示输出的是字符 ，%s格式符表示输出的是字符串。%s和%c的区别是: %s会一直打印到\0停止，而%c只打印一个字符就停了。
 
 首先，我举个简单的例子：
 
 char *p1="hello!";  //定义字符型指针p1，并将指针p1指向字符串“hello!”的首地址。
 
 char s[10]="hello!";  //定义数组s,并将其初始化赋值。
 
 然而，如果char s[10]; s="hello!";这样就会报错，为什么呢？原因很简单，因为数组名是常量。
 
 言归正传，我现在举两个简单的例子：
 
 例子1
 
 void main（）
 
 {
 
 char p[]="abcdef"; //字符串常量"abcdef"被拷贝到栈中分配给p[]数组的内存中保存
 printf("字符串\"abcdef\"的地址为:%zd","abcdef");
 
 p[0]='Y';
 
 printf("指针p自身在栈中地址为:%zd",&p);
 printf("指针p中存储着某个对象的地址为:%zd",p);
 printf("指针p中存储着某个对象的内容为:%s",*p); //因为p保存着p[0]的地址，相当于*p[0]，结果为Y
 printf("打印字符数组的全部内容: %s",p); //%s和%c的区别是: %s会一直打印到\0停止，而%c只打印一个字符就停了
 
 }
 
 在本段程序中输出Ybcdef
 
 例子2
 
 void main（）
 
 {
 
 char *p="abcdef"; //字符串"abcdef"仍然在运行时的常量区，所以不可更改
 
 p[0]='Y';
 
 printf("%s",p);
 
 }
 
 本段程序却抛出异常，为什么？
 
 在例子2中，char *p="abcdef",指针p是存储在堆栈区，但字符串是常量，存储在常量区，只是指针p指向了存储在常量区的字符串首地址，此时不能改变常量区的字符串的值。
 
 在例子1中，char p[]="abcdef",此处的赋值是将常量区的字符串“abcdef”拷贝到了堆栈区的数组p的空间了。数组p是在堆栈区开辟了空间，此时是可以修改字符串的值，因为修改的是堆栈区的字符串的值。另外此时的数组名p是堆栈区中的”abcdef“的首地址。
 
 */

