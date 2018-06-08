//
//  CCNavigationBarMenuTableViewCell.h
//  GreatBody
//
//  Created by iot_iMac on 2018/6/8.
//

#import <UIKit/UIKit.h>
#import "GBPulldownMenuItem.h"

@interface GBPulldownMenuCell : UITableViewCell

@property (nonatomic, strong) UIImageView             *itemImageView;
@property (nonatomic, strong) UILabel                 *itemTitleLabel;

@property (nonatomic, strong) GBPulldownMenuItem *model;

@end
