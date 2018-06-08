//
//  CCNavigationBarMenuItem.m
//  GreatBody
//
//  Created by iot_iMac on 2018/6/8.
//

#import "GBPulldownMenuItem.h"

@implementation GBPulldownMenuItem

+ (instancetype)navigationBarMenuItemWithImage:(UIImage *)image title:(NSString *)title {
    return [[GBPulldownMenuItem alloc] initWithImage:image title:title];
}

- (instancetype)initWithImage:(UIImage *)image title:(NSString *)title {
    self = [super init];
    if (self) {
        self.image = image;
        self.title = title;
        self.titleColor = [UIColor colorWithRed:74/255.0 green:74/255.0 blue:74/255.0 alpha:1];
        self.titleFont = [UIFont systemFontOfSize:17];
    }
    return self;
}

@end
