//
//  ViewController.m
//  Unix时间&NSDataFormatter
//
//  Created by iot_imac on 2019/1/4.
//  Copyright © 2019年 iot_iMac. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()


@end

@implementation ViewController

//关于NSDate的具体理解详见：印象笔记-》NSDate和NSDateFormatter深入理解
- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSDate *date = [NSDate date];
    
    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    fmt.dateFormat = @"yyyy-MM-dd HH:mm:ss Z";
    fmt.timeZone = [NSTimeZone timeZoneForSecondsFromGMT:0]; //0时区
    fmt.calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];//公历
    NSString *str = [fmt stringFromDate:date];
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init]; //如不进一步设置，则默认赋值手机当前的日历和时区
    
    formatter.calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian]; //强制所有人都显示公历,防止用户切换手机日历为佛历
    
    [formatter setTimeZone:[NSTimeZone timeZoneWithAbbreviation:@"UTC"]];
    [formatter setTimeZone:[NSTimeZone timeZoneWithAbbreviation:@"GMT"]];
    formatter.timeZone = [NSTimeZone timeZoneForSecondsFromGMT:0]; //0时区
    
    [formatter setDateFormat:@"YYYY-MM-dd HH:mm:ss"]; //以周计算年，会导致2018.12.31被错计算为2019.12.31
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss Z"];
}

/*
 当前手机为佛历，日本东九区时区
 */

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    NSArray *strArr = @[@"2018/12/30 10:10:10",@"2018/12/31 10:10:10",@"2019/01/01 10:10:10"];
    
    for (NSString *str in strArr) {
        NSDate *date = [self getDateFromString:str];
        NSString *str = [self getStringFromDate:date];
    }
    
}


#pragma mark ============ NSDate和NSString转换(date永远是公历、0时区，NSDateFormatter设置的日历和时区只针对str有效) ==============
/*
 date转str：NSDateFormatter的日历和时区，决定转换后的字符串的显示格式
 str转date：NSDateFormatter的日历和时区，明确转换前字符串的来源信息，以便系统能够根据你提供的字符串的时区和日历，准确的转换为NSDate(公历、0时区)
 注意：如果不设置NSDateFormatter的日历和时区，默认获取用户当前手机的日历和时区
 故以后在转换时间和字符串之前一定要设置日历和时区
 */



- (NSDate *)getDateFromString:(NSString *)dateString {
    
    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    
//    ///[formatter setTimeZone:[NSTimeZone timeZoneWithAbbreviation:@"UTC"]];  //@"UTC"和@"GMT"一样，都是0时区
//    fmt.timeZone = [NSTimeZone timeZoneForSecondsFromGMT:(0 * 3600)];
    fmt.timeZone = [NSTimeZone timeZoneForSecondsFromGMT:(8 * 3600)];
    
    fmt.calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
//    fmt.calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierJapanese];
//    fmt.calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierBuddhist];
    
    fmt.dateFormat = @"yyyy-MM-dd HH:mm:ss";

    NSDate *date = [fmt dateFromString:dateString]; //设置fmt日历和时区，标明dateString的信息，以便系统准确转换为公历0时区的NSDate
    
    NSLog(@"---输入dateStr:%@ 输出date:%@ ",dateString,date);
    
    return date;
}


- (NSString *)getStringFromDate:(NSDate *)date {

    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    
//    //[formatter setTimeZone:[NSTimeZone timeZoneWithAbbreviation:@"UTC"]];  //@"UTC"和@"GMT"一样，都是0时区
    fmt.timeZone = [NSTimeZone timeZoneForSecondsFromGMT:(0 * 3600)];
//    fmt.timeZone = [NSTimeZone timeZoneForSecondsFromGMT:(8 * 3600)];

//    fmt.calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
//    fmt.calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierJapanese];
    fmt.calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierBuddhist];
    
    //[formatter setDateFormat:@"YYYY-MM-dd HH:mm:ss"]; //2018.12.31位于2019年第一周星期一，故会被计算为2019.12.31
    [fmt setDateFormat:@"yyyy-MM-dd HH:mm:ss Z"]; //2019-01-01 10:10:10 GMT+8
    
    NSString *dateString = [fmt stringFromDate:date]; //设置fmt日历和时区，告诉系统你需要将公历0时区的NSDate转换成什么日历、什么时区的dateString
    
    NSLog(@"---输入date:%@ 输出dateString:%@",date,dateString);
    
    return dateString;
    
}



/*
 站长工具转换：(采用公历、东八区)
 2018/12/30 10:10:10  -》  1546135810
 2018/12/31 10:10:10  -》  1546222210
 2019/01/01 10:10:10  -》  1546308610
 */

#pragma mark ============ NSDate与时间戳转换(根本不涉及NSDateFormatter，故此转换与NSDateFormatter无关) ==============

- (void)test {
    NSTimeInterval t[3] = {1546135810,1546222210,1546308610};
    for (int i = 0; i < sizeof(t)/sizeof(NSTimeInterval); i++) {
        NSDate *date = [self getDateFromUnixSeconds:t[i]];
        NSTimeInterval seconds = [self getUnixSecondsFromDate:date];
    }
}

- (NSTimeInterval)getUnixSecondsFromDate:(NSDate *)date {
    
    NSTimeInterval seconds = [date timeIntervalSince1970];
    NSLog(@"---输入date:%@ 输出unixSeconds:%f ",date,seconds);
    return seconds;
}



- (NSDate *)getDateFromUnixSeconds:(NSTimeInterval)seconds {
    
    NSDate* date = [NSDate dateWithTimeIntervalSince1970:seconds]; //Creates and returns a date object by seconds from 00:00:00 UTC on 1 January 1970.
    NSLog(@"---输入unixSeconds:%f 输出date:%@  ",seconds, date);
    return date;
    
}



@end
