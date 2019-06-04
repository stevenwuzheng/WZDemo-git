//
//  XJHDevTools.m
//  GoodNutrition
//
//  Created by iot_user on 2018/11/22.
//  Copyright © 2018年 Percyyang. All rights reserved.
//

#import "XJHDevTools.h"
#import "sys/utsname.h"
#import <CommonCrypto/CommonDigest.h>
//#import <ShareSDKExtension/ShareSDK+Extension.h>

@implementation XJHDevTools
//+(NSInteger)getAgeByBirthday:(NSString *)birthday{
//    //计算年龄
//    // 1:得到出生日期
//    NSMutableString *fullStr = [[NSMutableString alloc] initWithString:birthday];
//    NSLog(@"%@",fullStr);
//
//    //    NSString *unitYear = MyLocalizedString(@"Year", nil);
//    //    NSString *unitMonth = MyLocalizedString(@"Month", nil);
//    //    NSString *unitDay = MyLocalizedString(@"Day", nil);
//
//    NSRange yearRange = [fullStr rangeOfString:@"/"];
//    [fullStr deleteCharactersInRange:yearRange];
//
//
//    NSRange monthRange = [fullStr rangeOfString:@"/"];
//    [fullStr deleteCharactersInRange:monthRange];
//
//
//    //    NSRange dayRange = [fullStr rangeOfString:@""];
//    //    [fullStr deleteCharactersInRange:dayRange];
//
//    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
//    [dateFormatter setLocale:[NSLocale currentLocale]];
//    [dateFormatter setDateFormat:@"yyyyMMdd"];
//    NSDate *birthdayDate = [dateFormatter dateFromString:fullStr];
//    NSTimeZone *zone = [NSTimeZone systemTimeZone];
//    NSInteger format = [zone secondsFromGMTForDate:birthdayDate];
//    birthdayDate = [birthdayDate dateByAddingTimeInterval:format];
//    //获取当前时间
//    NSDate *currentDate = [NSDate date];
//    NSTimeInterval time = [currentDate timeIntervalSinceDate:birthdayDate];
//    CGFloat Age = ((CGFloat)time)/(3600*24*365);
//    return floor(Age);
//}
+(struct YMDStruct)getYMD:(NSInteger)days{
    NSDate * nowDate = [NSDate date];
    NSDate * theDate;
    if (days) {
        NSTimeInterval oneDay = 24*60*60*1;
        theDate = [nowDate initWithTimeIntervalSinceNow:oneDay*days];
    }else{
        theDate = nowDate;
    }
    //year
    NSDateFormatter * yearFormatter = [[NSDateFormatter alloc]init];
    [yearFormatter setDateFormat:@"yyyy"];
    NSString * yearStr = [yearFormatter stringFromDate:theDate];
    //month
    NSDateFormatter * monthFormatter = [[NSDateFormatter alloc]init];
    [monthFormatter setDateFormat:@"MM"];
    NSString * monthStr = [monthFormatter stringFromDate:theDate];
    //
    //day
    NSDateFormatter * dayFormatter = [[NSDateFormatter alloc]init];
    [dayFormatter setDateFormat:@"dd"];
    NSString * dayStr = [dayFormatter stringFromDate:theDate];
    
    NSInteger year = [yearStr integerValue];
    NSInteger month = [monthStr integerValue];
    NSInteger day = [dayStr integerValue];
    struct YMDStruct date = {year,month,day};
    return date;
}
+(UIImage *)launchImage{
    CGSize size = [UIScreen mainScreen].bounds.size;
    NSString * orientation = nil;
    if ([[UIApplication sharedApplication] statusBarOrientation] == UIInterfaceOrientationPortraitUpsideDown || [[UIApplication sharedApplication] statusBarOrientation] == UIInterfaceOrientationPortrait) {
        orientation = @"Portrait";
    }else{
        orientation = @"Landscape";
    }
    NSString * launchImage = nil;
    NSArray<NSDictionary *> * imageArray = [[[NSBundle mainBundle] infoDictionary] valueForKey:@"UILaunchImages"];
    for (NSDictionary * dic in imageArray) {
        CGSize imgSize = CGSizeFromString(dic[@"UILaunchImageSize"]);
        if (CGSizeEqualToSize(imgSize, size) && [orientation isEqualToString:dic[@"UILaunchImageOrientation"]]) {
            launchImage = dic[@"UILaunchImageName"];
        }
    }
    return [UIImage imageNamed:launchImage];
}
+ (NSString*)deviceVersion
{
    // 需要#import "sys/utsname.h"
    struct utsname systemInfo;
    uname(&systemInfo);
    
    NSString *deviceModel = [NSString stringWithCString:systemInfo.machine encoding:NSASCIIStringEncoding];
    
    
    if ([deviceModel isEqualToString:@"iPhone3,1"])    return @"iPhone 4";
    if ([deviceModel isEqualToString:@"iPhone3,2"])    return @"iPhone 4";
    if ([deviceModel isEqualToString:@"iPhone3,3"])    return @"iPhone 4";
    if ([deviceModel isEqualToString:@"iPhone4,1"])    return @"iPhone 4S";
    if ([deviceModel isEqualToString:@"iPhone5,1"])    return @"iPhone 5";
    if ([deviceModel isEqualToString:@"iPhone5,2"])    return @"iPhone 5 (GSM+CDMA)";
    if ([deviceModel isEqualToString:@"iPhone5,3"])    return @"iPhone 5c (GSM)";
    if ([deviceModel isEqualToString:@"iPhone5,4"])    return @"iPhone 5c (GSM+CDMA)";
    if ([deviceModel isEqualToString:@"iPhone6,1"])    return @"iPhone 5s (GSM)";
    if ([deviceModel isEqualToString:@"iPhone6,2"])    return @"iPhone 5s (GSM+CDMA)";
    if ([deviceModel isEqualToString:@"iPhone7,1"])    return @"iPhone 6 Plus";
    if ([deviceModel isEqualToString:@"iPhone7,2"])    return @"iPhone 6";
    if ([deviceModel isEqualToString:@"iPhone8,1"])    return @"iPhone 6s";
    if ([deviceModel isEqualToString:@"iPhone8,2"])    return @"iPhone 6s Plus";
    if ([deviceModel isEqualToString:@"iPhone8,4"])    return @"iPhone SE";
    // 日行两款手机型号均为日本独占，可能使用索尼FeliCa支付方案而不是苹果支付
    if ([deviceModel isEqualToString:@"iPhone9,1"])    return @"iPhone 7";
    if ([deviceModel isEqualToString:@"iPhone9,2"])    return @"iPhone 7 Plus";
    if ([deviceModel isEqualToString:@"iPhone9,3"])    return @"iPhone 7";
    if ([deviceModel isEqualToString:@"iPhone9,4"])    return @"iPhone 7 Plus";
    if ([deviceModel isEqualToString:@"iPhone10,1"])   return @"iPhone_8";
    if ([deviceModel isEqualToString:@"iPhone10,4"])   return @"iPhone_8";
    if ([deviceModel isEqualToString:@"iPhone10,2"])   return @"iPhone_8_Plus";
    if ([deviceModel isEqualToString:@"iPhone10,5"])   return @"iPhone_8_Plus";
    if ([deviceModel isEqualToString:@"iPhone10,3"])   return @"iPhone X";
    if ([deviceModel isEqualToString:@"iPhone10,6"])   return @"iPhone X";
    if ([deviceModel isEqualToString:@"iPhone11,8"])   return @"iPhone XR";
    if ([deviceModel isEqualToString:@"iPhone11,2"])   return @"iPhone XS";
    if ([deviceModel isEqualToString:@"iPhone11,6"])   return @"iPhone XS Max";
    if ([deviceModel isEqualToString:@"iPhone11,4"])   return @"iPhone XS Max";
    if ([deviceModel isEqualToString:@"iPod1,1"])      return @"iPod Touch 1G";
    if ([deviceModel isEqualToString:@"iPod2,1"])      return @"iPod Touch 2G";
    if ([deviceModel isEqualToString:@"iPod3,1"])      return @"iPod Touch 3G";
    if ([deviceModel isEqualToString:@"iPod4,1"])      return @"iPod Touch 4G";
    if ([deviceModel isEqualToString:@"iPod5,1"])      return @"iPod Touch (5 Gen)";
    if ([deviceModel isEqualToString:@"iPad1,1"])      return @"iPad";
    if ([deviceModel isEqualToString:@"iPad1,2"])      return @"iPad 3G";
    if ([deviceModel isEqualToString:@"iPad2,1"])      return @"iPad 2 (WiFi)";
    if ([deviceModel isEqualToString:@"iPad2,2"])      return @"iPad 2";
    if ([deviceModel isEqualToString:@"iPad2,3"])      return @"iPad 2 (CDMA)";
    if ([deviceModel isEqualToString:@"iPad2,4"])      return @"iPad 2";
    if ([deviceModel isEqualToString:@"iPad2,5"])      return @"iPad Mini (WiFi)";
    if ([deviceModel isEqualToString:@"iPad2,6"])      return @"iPad Mini";
    if ([deviceModel isEqualToString:@"iPad2,7"])      return @"iPad Mini (GSM+CDMA)";
    if ([deviceModel isEqualToString:@"iPad3,1"])      return @"iPad 3 (WiFi)";
    if ([deviceModel isEqualToString:@"iPad3,2"])      return @"iPad 3 (GSM+CDMA)";
    if ([deviceModel isEqualToString:@"iPad3,3"])      return @"iPad 3";
    if ([deviceModel isEqualToString:@"iPad3,4"])      return @"iPad 4 (WiFi)";
    if ([deviceModel isEqualToString:@"iPad3,5"])      return @"iPad 4";
    if ([deviceModel isEqualToString:@"iPad3,6"])      return @"iPad 4 (GSM+CDMA)";
    if ([deviceModel isEqualToString:@"iPad4,1"])      return @"iPad Air (WiFi)";
    if ([deviceModel isEqualToString:@"iPad4,2"])      return @"iPad Air (Cellular)";
    if ([deviceModel isEqualToString:@"iPad4,4"])      return @"iPad Mini 2 (WiFi)";
    if ([deviceModel isEqualToString:@"iPad4,5"])      return @"iPad Mini 2 (Cellular)";
    if ([deviceModel isEqualToString:@"iPad4,6"])      return @"iPad Mini 2";
    if ([deviceModel isEqualToString:@"iPad4,7"])      return @"iPad Mini 3";
    if ([deviceModel isEqualToString:@"iPad4,8"])      return @"iPad Mini 3";
    if ([deviceModel isEqualToString:@"iPad4,9"])      return @"iPad Mini 3";
    if ([deviceModel isEqualToString:@"iPad5,1"])      return @"iPad Mini 4 (WiFi)";
    if ([deviceModel isEqualToString:@"iPad5,2"])      return @"iPad Mini 4 (LTE)";
    if ([deviceModel isEqualToString:@"iPad5,3"])      return @"iPad Air 2";
    if ([deviceModel isEqualToString:@"iPad5,4"])      return @"iPad Air 2";
    if ([deviceModel isEqualToString:@"iPad6,3"])      return @"iPad Pro 9.7";
    if ([deviceModel isEqualToString:@"iPad6,4"])      return @"iPad Pro 9.7";
    if ([deviceModel isEqualToString:@"iPad6,7"])      return @"iPad Pro 12.9";
    if ([deviceModel isEqualToString:@"iPad6,8"])      return @"iPad Pro 12.9";
    
    if ([deviceModel isEqualToString:@"AppleTV2,1"])      return @"Apple TV 2";
    if ([deviceModel isEqualToString:@"AppleTV3,1"])      return @"Apple TV 3";
    if ([deviceModel isEqualToString:@"AppleTV3,2"])      return @"Apple TV 3";
    if ([deviceModel isEqualToString:@"AppleTV5,3"])      return @"Apple TV 4";
    
    if ([deviceModel isEqualToString:@"i386"])         return @"Simulator";
    if ([deviceModel isEqualToString:@"x86_64"])       return @"Simulator";
    return deviceModel;
    
    
}

+(NSString *)systemLanguage{
    NSString * language = [NSLocale preferredLanguages].firstObject;
    return language;
}
+(NSString *)md5Str:(NSString *)str
{
    const char *myPasswordd = [str UTF8String];
    unsigned char md5c[16];
    CC_MD5(myPasswordd, (CC_LONG)strlen(myPasswordd), md5c);
    
    NSMutableString *md5Str = [NSMutableString string];
    
    for (int i =0; i<16; i++) {
        [md5Str appendFormat:@"%02x",md5c[i]];
    }
    
    return md5Str;
}
#pragma mark对图片大小进行压
+(UIImage*)imageWithImage:(UIImage *)image scaledToSize:(CGSize)newSize{
    //创建一个图形图像上下文
    UIGraphicsBeginImageContext(newSize);
    //将旧图形按要求绘制成新图形
    [image drawInRect:CGRectMake(0, 0, newSize.width, newSize.height)];
    //获取修改后的新图形
    UIImage *newImage=UIGraphicsGetImageFromCurrentImageContext();
    //结束绘制
    UIGraphicsEndImageContext();
    return newImage;
}
+(NSString *)getTimeWithFomatter:(NSString *)formatter{
    NSDateFormatter * dateFormatter = [[NSDateFormatter alloc]init];
    [dateFormatter setDateFormat:formatter];
    NSString * time = [dateFormatter stringFromDate:[NSDate date]];
    return time;
}

+(NSInteger)daysCountOfMonth:(NSInteger)month andYear:(NSInteger)year

{
    NSInteger days = 30;
    if((month == 1)||(month == 3)||(month == 5)||(month == 7)||(month == 8)||(month == 10)||(month == 12)){
        days = 31;
    }else if((month == 4)||(month == 6)||(month == 9)||(month == 11)){
        days = 30;
    }else{
        if((year%400 == 0)||(year%4==0 && year%100!=0))//闰年
        {
            days =  29;
        }else{
            days =  28;
        }
    }
    
    return days;
}
+(NSString *)dataToJsonString:(NSArray *)data{
    if ([data isKindOfClass:[NSArray class]]) {
        NSError * error = nil;
        NSData * jsonData  =[NSJSONSerialization dataWithJSONObject:data options:(NSJSONWritingPrettyPrinted) error:&error];
        if (!jsonData) {
            NSLog(@"转换json出错:%@",error);
            return nil;
        }else{
            NSString * str = [[NSString alloc]initWithData:jsonData encoding:NSUTF8StringEncoding];
            NSMutableString *jsonStr = [[NSMutableString alloc]initWithString:str];
            NSRange range1 = {0,str.length};
            [jsonStr replaceOccurrencesOfString:@" " withString:@"" options:NSLiteralSearch range:range1];
            NSRange range2 = {0,jsonStr.length};
            [jsonStr replaceOccurrencesOfString:@"\n" withString:@"" options:NSLiteralSearch range:range2];
            return [jsonStr copy];
        }
    }else{
        NSLog(@"不是dictionary或array，不可转");
        return nil;
    }
}
+(NSString *)appName{
    NSDictionary * dic = [[NSBundle mainBundle] infoDictionary];
    NSString *appName = [dic objectForKey:@"CFBundleDisplayName"];
    return appName;
}
+(NSString *)appVersion{
    NSDictionary * dic = [[NSBundle mainBundle] infoDictionary];
    NSString * version = [dic objectForKey:@"CFBundleShortVersionString"];
    return version;
}
+(NSString *)systemVersion{
    
    return [[UIDevice currentDevice] systemVersion];
}
+ (UIImage *)getImageWithView:(UITableView *)tableView {
    UIImage* viewImage = nil;
    UITableView *scrollView = tableView;
    UIGraphicsBeginImageContextWithOptions(scrollView.contentSize, scrollView.opaque, 0.0);
    {
        CGPoint savedContentOffset = scrollView.contentOffset;
        CGRect savedFrame = scrollView.frame;
        
        scrollView.contentOffset = CGPointZero;
        scrollView.frame = CGRectMake(0, 0, scrollView.contentSize.width, scrollView.contentSize.height);
        
        [scrollView.layer renderInContext: UIGraphicsGetCurrentContext()];
        viewImage = UIGraphicsGetImageFromCurrentImageContext();
        
        scrollView.contentOffset = savedContentOffset;
        scrollView.frame = savedFrame;
    }
    UIGraphicsEndImageContext();
    
    return viewImage;
}
@end
