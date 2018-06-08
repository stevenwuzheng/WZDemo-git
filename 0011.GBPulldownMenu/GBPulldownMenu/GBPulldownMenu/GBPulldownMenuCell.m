//
//  CCNavigationBarMenuTableViewCell.m
//  GreatBody
//
//  Created by iot_iMac on 2018/6/8.
//

#import "GBPulldownMenuCell.h"

@implementation GBPulldownMenuCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self _initSubviews];
    }
    return self;
}

- (void)_initSubviews {
    self.itemImageView = [[UIImageView alloc] init];
    self.itemImageView.contentMode = UIViewContentModeScaleAspectFit;
    [self.contentView addSubview:self.itemImageView];
    [self.itemImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).offset(15);
        make.centerY.equalTo(self.contentView);
        make.size.mas_equalTo(ITEM_IMAGE_SIZE);
    }];
    
    self.itemTitleLabel = [[UILabel alloc] init];
    self.itemTitleLabel.font = [UIFont systemFontOfSize:17];
    self.itemTitleLabel.textColor = [UIColor colorWithRed:74/255.0 green:74/255.0 blue:74/255.0 alpha:1];
    [self.contentView addSubview:self.itemTitleLabel];
    [self.itemTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.itemImageView.mas_right).offset(10);
        make.centerY.equalTo(self.contentView);
    }];
}

#pragma mark - setter
- (void)setModel:(GBPulldownMenuItem *)model {
    self.itemImageView.image = model.image;
    self.itemTitleLabel.text = model.title;
    self.itemTitleLabel.font = model.titleFont;
    self.itemTitleLabel.textColor = model.titleColor;
}

@end
