//
//  main.c
//  测试C语言数组
//
//  Created by iot_iMac on 2018/8/20.
//  Copyright © 2018年 iot_iMac. All rights reserved.
//

#include <stdio.h>
#import <string.h>


void testStr1(void) {
    
    printf("\n------------\n");
    char *s = "abc"; //计算char *s这种字符串，只能用strlen(s)，不能用sizeof(s)
    printf("sizeof(s):%lu - strlen(s):%lu",sizeof(s),strlen(s)); //sizeof计算的永远是(x)中x的占用空间，strlen(x)计算字符串的长度
    //结果 8 - 3 ("abc"其实是占4B的，用sizeof计算的是占用空间，本该4B，但是因s是指针，sizeof见了指针就会立马计算指针变量本身占用的空间，即8B；而不会计算指针指向的对象的size.) sizeof(数组名)计算数组的占用空间,如数组定义时申明了长度n，则得到的就是n个Byte；如未申明，则按数组的元素个数*每个元素占用的Byte来计算。
    //strlen(指针/数组名)只用来计算字符串的长度，其返回字符串占用的n个Byte，但是不包含\0

}

void testStr2(void) {

    printf("\n------------\n");
    char a[2] = "abc"; //这种写法是错误的,strlen(a)系统会一直找到最近的\0为止
    //char a[10] = "abc"; //sizeof(a)=10;strlen(a)=3; //strlen不包含\0
    char b[3] = {'a','b','c'};  //错误的写法
    char c[4] = {'a','b','c','\0'};
    printf("sizeof: a[2]-b[3]-c[4]: %lu - %lu - %lu",sizeof(a),sizeof(b),sizeof(c)); //计算字符数组占用的Byte数，只能用sizeof(数组名),不能用strlen(数组名)
    printf("\n------------\n");
    printf("strlen: a[2]-b[3]-c[4]: %lu - %lu - %lu",strlen(a),strlen(b),strlen(c)); //计算字符串长度,直到\0才结束，b[3]的写法,会一直往后找,直到找到\0为止，可能每次运行结果不一样。要看内存中最近的\0在哪里

}

void testStr3(void) {
    
    printf("\n------------\n");
    char a[] = "abc";//系统会自动在末尾加上\0, 正确
    char b[] = {'a','b','c'}; //会一直找下去直到\0，错误
    char c[] = {'a','b','c','\0'};//正确
    printf("sizeof: a[]-b[]-c[]: %lu - %lu - %lu",sizeof(a),sizeof(b),sizeof(c));
    printf("\n------------\n");
    printf("strlen: a[]-b[]-c[]: %lu - %lu - %lu",strlen(a),strlen(b),strlen(c));

}

void testStr4(void) {
    
    printf("\n------------\n");
    
    char str1[] = {"happy"}; //可以省略花括号，如下所示
    printf("sizeof(str1):%lu - strlen(str1):%lu",sizeof(str1),strlen(str1));

    printf("\n------------\n");
    
    char str2[] = "happy";
    printf("sizeof(str2):%lu - strlen(str2):%lu",sizeof(str2),strlen(str2));
    
    printf("\n------------\n");

}

int main(int argc, const char * argv[]) {
    // insert code here...
    printf("Hello, World!\n");
    
    testStr1();
    testStr2();
    testStr3();
    testStr4();
    
    return 0;
}

/*
 字符串常量来初始化字符数组：
 char str[ ]={“I am happy”}; 可以省略花括号，如下所示
 char str[ ]=”I am happy”;
 注意：上述这种字符数组的整体赋值只能在字符数组初始化时使用，不能用于字符数组的赋值，字符数组的赋值只能对其元素一一赋值，下面的赋值方法是错误的
 char str[ ];
 str=”I am happy”;
 注意：数组str的长度不是10，而是11，这点请务必记住，因为字符串常量”I am happy”的最后由系统自动加上一个’\0’
 
 上面的初始化与下面的初始化等价
 char str[ ]={‘I’,’ ‘,’a’,’m’,’ ‘,’h’,’a’,’p’,’p’,’y’,’\0’};
 而不与下面的等价
 char str[ ]={‘I’,’ ‘,’a’,’m’,’ ‘,’h’,’a’,’p’,’p’,’y’};
 前者的长度是11，后者的长度是10.
 
 说明：字符数组并不要求它的最后一个字符为’\0’，甚至可以不包含’\0’，向下面这样写是完全合法的。
 char str[5]={‘C’,’h’,’i’,’n’,’a’};
 
 #include <stdio.h>
 void main(void)
 {
 char c1[]={'I',' ','a','m',' ','h','a','p','p','y'};
 char c2[]="I am happy";
 int i1=sizeof(c1);
 int i2=sizeof(c2);
 printf("%d\n",i1);
 printf("%d\n",i2);
 }
 
 结果：10 11
 
 3、字符串的表示形式
 在C语言中，可以用两种方法表示和存放字符串：
 （1）用字符数组存放一个字符串
 char str[ ]=”I love China”;
 （2）用字符指针指向一个字符串
 char* str=”I love China”;
 对于第二种表示方法，有人认为str是一个字符串变量，以为定义时把字符串常量”I love China”直接赋给该字符串变量，这是不对的。
 C语言对字符串常量是按字符数组处理的，在内存中开辟了一个字符数组用来存放字符串常量，程序在定义字符串指针变量str时只是把字符串首地址（即存放字符串的字符数组的首地址）赋给str。
 两种表示方式的字符串输出都用
 printf(“%s\n”,str);
 %s表示输出一个字符串，给出字符指针变量名str（对于第一种表示方法，字符数组名即是字符数组的首地址，与第二种中的指针意义是一致的），则系统先输出它所指向的一个字符数据，然后自动使str自动加1，使之指向下一个字符…，如此，直到遇到字符串结束标识符 ” \0 “。
 puts(str); //putchar('a');输出单个字符
 */
