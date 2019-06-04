//
//  XJHDevTools.h
//  GoodNutrition
//
//  Created by iot_user on 2018/11/22.
//  Copyright © 2018年 Percyyang. All rights reserved.
//

#import <Foundation/Foundation.h>


struct YMDStruct{
    NSInteger year;
    NSInteger month;
    NSInteger day;
};
////375x667的屏幕
//#define W(w)   (w/375)*[UIScreen mainScreen].bounds.size.width
//#define H(h)   (h/667)*[UIScreen mainScreen].bounds.size.height

NS_ASSUME_NONNULL_BEGIN

@interface XJHDevTools : NSObject

//+(NSInteger)getAgeByBirthday:(NSString *)birthday;//通过yyyy年MM月dd日获取年纪
+(struct YMDStruct)getYMD:(NSInteger)days;//获取当前时间延后days天的年月日的结构体
+(UIImage *)launchImage;//获取应用启动图
+ (NSString*)deviceVersion;//获取手机设备名称
+(NSString *)systemLanguage;//获取当前语言
+(NSString *)md5Str:(NSString *)str;//MD5
+(UIImage*)imageWithImage:(UIImage *)image scaledToSize:(CGSize)newSize;//压缩图片
+(NSString *)getTimeWithFomatter:(NSString *)formatter;
//微博、微信、QQ、QZone、Facebook
//+(BOOL)isInstallApp:(SSDKPlatformType)platformType;
//根据年月日获取天数
+(NSInteger)daysCountOfMonth:(NSInteger)month andYear:(NSInteger)year;
//dictionary或array转jsonStr
+(NSString *)dataToJsonString:(NSArray *)data;
+(NSString *)systemVersion;
+(NSString *)appName;
+(NSString *)appVersion;
//获取tableView的截图
+ (UIImage *)getImageWithView:(UITableView *)tableView;
@end

NS_ASSUME_NONNULL_END
