//
//  ZW_PublicHeader.h
//  MineSettingDemo
//
//  Created by WZ on 2017/11/9.
//  Copyright © 2017年 WZ. All rights reserved.
//

#ifndef ZW_PublicHeader_h
#define ZW_PublicHeader_h

//只是给oc的头文件添加这个拷贝这个源文件,c语言的文件不拷贝
#ifdef __OBJC__

//颜色工具宏
#define  RGBA(r, g, b, a)                [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]
#define  RGB(r, g, b)                    RGBA(r, g, b, 1.0)

#define  ZW_TableViewColor               RGB(245, 245, 245)
#define  ZW_SeparatorColor               RGB(188, 186, 193)
#define  ZW_CellTitleColor               RGB(0, 0, 0)
#define  ZW_CellDetailColor              RGB(0, 0, 0)
#define  ZW_CellAccTextColor             [UIColor grayColor]
#define  ZW_HeaderFooterColor            [UIColor lightGrayColor]
#define  ZW_CellSelectedColor            [UIColor lightGrayColor]

//cell默认值
#define  ZW_RowHeight               50.0
#define  ZW_SectionHeaderH          15.0
#define  ZW_SectionFooterH          0.1
#define  ZW_SeparatorH              0.5 //cell分割线高度
#define  ZW_SeparatorLeftOffset     10 //cell水平margin为10，垂直margin为5
#define  ZW_CellMargin_Hor          10
#define  ZW_CellMargin_Ver          5

//9.字体大小
#define  Large_TEXT_FONT            [UIFont systemFontOfSize:25]
#define  ZW_CellTitle_FONT          [UIFont systemFontOfSize:17]
#define  ZW_CellAccText_FONT        [UIFont systemFontOfSize:14]
#define  ZW_CellDetail_FONT         [UIFont systemFontOfSize:12]
#define  ZW_HeaderFooter_FONT       [UIFont systemFontOfSize:15]


//10.在非 ARC 环境下运行下面的代码
#if !__has_feature(objc_arc)
#endif


//11.打开或关闭打印
#ifdef DEBUG
// ... 是一个可变参数  __VA_VRGS__ 可变参数 ,在调试的时候所有打印的东西,都可以打印,当把模式更改为其他的时候的,这些就都不能打印了
#define NSLog(...)  NSLog(__VA_ARGS__)
#else
#define NSLog(...)
#endif



#endif //这里写只可以在oc中使用的头文件,c语言不能使用的
#endif /* ZW_PublicHeader_h */
