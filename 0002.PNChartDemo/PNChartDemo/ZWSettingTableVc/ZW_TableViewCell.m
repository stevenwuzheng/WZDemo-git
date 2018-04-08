//
//  ZW_TableViewCell.m
//  MineSettingDemo
//
//  Created by WZ on 2017/11/9.
//  Copyright © 2017年 WZ. All rights reserved.
//

#import "ZW_TableViewCell.h"
#import "ZW_PublicHeader.h"
#import "ZW_RowItem.h"
#import "UIImage+ZWCircle.h"
#import "ZW_SectionItem.h" //涉及到各组的分割线问题


@interface ZW_TableViewCell ()

/**
 *  内部用来记录外界传入的该cell所在的section
 */
@property (nonatomic, strong)  ZW_SectionItem* sectionItem;
/**
 *  内部用来记录外界传入的该cell显示需要的row模型
 */
@property (nonatomic, strong)  ZW_RowItem* rowItem;
/**
 *  内部用来记录外界传入的该cell的indexPath
 */
@property (nonatomic, strong)  NSIndexPath* indexPath;


/**
 *  左侧头像
 */
@property (nonatomic, weak) UIImageView *leftImageView;

/**
 *  标题
 */
@property (nonatomic, weak) UILabel *titleLabel;

/**
 *  副标题
 */
@property (nonatomic, weak) UILabel *detailLabel;

/**
 *  cell顶部的 分割线
 */
@property (nonatomic, weak) UIView *topSeparatorLine;

/**
 *  cell底部的 分割线
 */
@property (nonatomic, weak) UIView *btmSeparatorLine;


//===== 以下都是用来设置cell右侧的accessoryView的控件 ========

/**
 *  文本标签
 */
@property (nonatomic, weak) UILabel *accLabel;//acc是accessory缩写

/**
 *  开关
 */
@property (nonatomic, weak) UISwitch *accSwitch;

/**
 *  右侧图像
 */
@property (nonatomic, weak) UIImageView *accIconImageView;

/**
 *  箭头
 */
@property (nonatomic, weak) UIImageView *accArrowImgView;


@end


static NSString * const ZW_TableViewCellID = @"ZW_TableViewCellID";
@implementation ZW_TableViewCell

#pragma mark ============ 懒加载cell的附件view,不一定会使用 ==============

/**
 *  监听开关值改变事件
 */
- (void)stValueChanged: (UISwitch *)sender{
    if (_rowItem.switchChangedBlock) {
        _rowItem.switchChangedBlock(sender.isOn);
    }
}



#pragma mark ============ 初始化cell ==============
/**
 * ViewController中的tableView:cellForRowAtIndexPath中关于cell重用、model获取、cell赋值的代码全部移转到这个方法
 * cell的展示形态，完全取决于section、rowItem模型的参数设定。
 * 注意： 类方法中的self是类对象，不能使用实例变量或属性
 */
+ (instancetype)cellWithTableView:(UITableView *)tableView sectionsArr:(NSArray *)sectionsArr indexPath:(NSIndexPath *)indexPath {
    
    //创建cell
    ZW_TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ZW_TableViewCellID]; //带indexPath的dequeue方法需要提前注册,否则崩溃,此处不能用
    
    if (cell == nil) {//新创建cell
        
        cell = [[ZW_TableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ZW_TableViewCellID];
        
        UIImageView *leftImageView = [[UIImageView alloc] init];
        leftImageView.contentMode = UIViewContentModeScaleAspectFit;
        [cell.contentView addSubview:leftImageView];
        cell.leftImageView = leftImageView;
        
        UILabel *titleLabel = [[UILabel alloc]init];
        titleLabel.font = ZW_CellTitle_FONT;
        titleLabel.textColor = ZW_CellTitleColor;
        titleLabel.numberOfLines = 0;
        titleLabel.textAlignment = NSTextAlignmentLeft;
        [cell.contentView addSubview:titleLabel];
        cell.titleLabel = titleLabel;
        
        UILabel *detailLabel = [[UILabel alloc]init];
        detailLabel.font = ZW_CellDetail_FONT;
        detailLabel.textColor = ZW_CellDetailColor;
        detailLabel.numberOfLines = 0;
        detailLabel.textAlignment = NSTextAlignmentLeft;
        [cell.contentView addSubview:detailLabel];
        cell.detailLabel = detailLabel;
        
        UILabel *accLabel = [[UILabel alloc] init];
        accLabel.font = ZW_CellAccText_FONT;
        accLabel.textColor = ZW_CellAccTextColor;
        accLabel.numberOfLines = 0;
        accLabel.textAlignment = NSTextAlignmentRight;
        [cell.contentView addSubview:accLabel];
        cell.accLabel = accLabel;
        
        UIImageView *accArrowImgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"icon_arrow"]];
        accArrowImgView.contentMode = UIViewContentModeCenter;
        [cell.contentView addSubview:accArrowImgView];
        cell.accArrowImgView = accArrowImgView;
        
        UISwitch *accSwitch = [[UISwitch alloc] init];
        [cell.accSwitch addTarget:self action:@selector(stValueChanged:) forControlEvents:UIControlEventValueChanged];
        [cell.contentView addSubview:accSwitch];
        cell.accSwitch = accSwitch;
            
        UIImageView *accIconImageView = [[UIImageView alloc] init];
        accIconImageView.contentMode = UIViewContentModeScaleAspectFit;
        [cell.contentView addSubview:accIconImageView];
        cell.accIconImageView = accIconImageView;
            
        //系统的分割线在控制器viewDidLoad中去掉了,现自己添加2条
        UIView *btmlineView = [[UIView alloc] init];
        btmlineView.backgroundColor = ZW_SeparatorColor;
        [cell.contentView addSubview:btmlineView];
        cell.btmSeparatorLine = btmlineView;

        UIView *topLineView = [[UIView alloc] init];
        topLineView.backgroundColor = ZW_SeparatorColor;
        [cell.contentView addSubview:topLineView];
        cell.topSeparatorLine = topLineView;

        //此句至关重要,否则图片框会跑出去
        cell.contentView.clipsToBounds = YES;
    }
    
    //获取模型、记录模型(布局子控件frame使用)
    ZW_SectionItem *sectionItem = sectionsArr[indexPath.section];
    ZW_RowItem *rowItem = sectionItem.rowItemsArr[indexPath.row];
    cell.sectionItem = sectionItem;
    cell.rowItem = rowItem;
    cell.indexPath = indexPath;
    
    //设置cell的分割线
    BOOL isShowTopSeparator = NO;
    BOOL isShowBtmSeparator = NO;
    
    switch (sectionItem.separatorType) {
        case ZW_SectionSeparatorTypeNone:
        {
            isShowTopSeparator = NO;
            isShowBtmSeparator = NO;
            break;
        }
        case ZW_SectionSeparatorTypeAll:
        {
            if (indexPath.row == 0) {//组内第一个cell的顶部和底部分割线都显示
                isShowTopSeparator = YES;
                isShowBtmSeparator = YES;
            } else {                //组内其他cell只显示底部分割线
                isShowTopSeparator = NO;
                isShowBtmSeparator = YES;
            }
            break;
        }
        case ZW_SectionSeparatorTypeTopAndBottom:
        {
            if (indexPath.row == 0) {
                isShowTopSeparator = YES;
                isShowBtmSeparator = NO;
            }
            else if (indexPath.row == sectionItem.rowItemsArr.count -1) {
                isShowTopSeparator = NO;
                isShowBtmSeparator = YES;
            }
            else {
                isShowTopSeparator = NO;
                isShowBtmSeparator = NO;
            }
            break;
        }
        case ZW_SectionSeparatorTypeOnlyMiddle:
        {
            if (indexPath.row == 0) {
                isShowTopSeparator = NO;
                isShowBtmSeparator = YES;
            }
            else if (indexPath.row == sectionItem.rowItemsArr.count -1) {
                isShowTopSeparator = NO;
                isShowBtmSeparator = NO;
            }
            else {
                isShowTopSeparator = YES;
                isShowBtmSeparator = YES;
            }
            break;
        }
        default:
            break;
    }
    
    cell.topSeparatorLine.hidden = !isShowTopSeparator;
    cell.btmSeparatorLine.hidden = !isShowBtmSeparator;

    //赋值
    if (rowItem.leftImageName) {
        UIImage *image = [UIImage imageNamed:rowItem.leftImageName]; //此处传nil会崩溃,故需提前判nil
        cell.leftImageView.image = rowItem.isLeftImageCircle ? image.zw_circleImage : image;
    }
    
    cell.titleLabel.text = rowItem.titleStr;
    cell.detailLabel.text = rowItem.detailStr;
    
    if (rowItem.accImageName) {
        UIImage *image = [UIImage imageNamed:rowItem.accImageName];
        cell.accIconImageView.image = rowItem.isAccImageCircle ? image.zw_circleImage : image;
    }
    
    cell.accLabel.text = rowItem.accLabelStr;
    cell.accSwitch.on = rowItem.isSwitchOn;
    
    cell.accSwitch.hidden = !rowItem.isShowSwitch;
    cell.accArrowImgView.hidden = !rowItem.isShowArrow;
    
    //注意:
    //1.cell的分割线是通过hidden来显示或隐藏
    //2.cell的所有子控件,因为布局互相依赖,所以通过width=0来显示或隐藏
    
    if (rowItem.isShowSwitch) {
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    } else {
        UIView *selectView = [[UIView alloc] init];
        selectView.backgroundColor = ZW_CellSelectedColor;
        cell.selectedBackgroundView = selectView;
    }

    
    
    return cell;
}




#pragma mark - 布局子控件
- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGFloat contentView_W = self.contentView.bounds.size.width;
    CGFloat contentView_H = self.contentView.bounds.size.height;
    CGFloat margin_hor = ZW_CellMargin_Hor; //水平间距
    CGFloat margin_ver = ZW_CellMargin_Ver; //垂直间距
    
    CGFloat leftImageX = margin_hor;
    CGFloat leftImageY = margin_ver;
    CGFloat leftImageH = contentView_H - 2 * margin_ver; //距cell上下边缘各5
    CGFloat leftImageW = self.rowItem.leftImageName ? leftImageH : 0.0;
    self.leftImageView.frame = CGRectMake(leftImageX, leftImageY, leftImageW, leftImageH);

    CGFloat accArrowY = leftImageY;
    CGFloat accArrowH = leftImageH;
    CGFloat accArrowW = 14; //给定的箭头图片为14x14
    CGFloat accArrowX = contentView_W - margin_hor - accArrowW;
    self.accArrowImgView.frame = CGRectMake(accArrowX, accArrowY, accArrowW, accArrowH);
    
    CGFloat accLabelY = leftImageY;
    CGFloat accLabelH = leftImageH;
    CGFloat accLabelX = contentView_W * 2/3;
    CGFloat rightEdgeW = self.rowItem.isShowArrow ? (margin_hor + accArrowW + margin_hor) : margin_hor;//显示或隐藏箭头,右边距宽度
    CGFloat accLabelW = self.rowItem.accLabelStr ? (contentView_W/3 - margin_hor - rightEdgeW) : 0.0; //左右间距10
    self.accLabel.frame = CGRectMake(accLabelX, accLabelY, accLabelW, accLabelH);
    
    CGFloat accSwitchH = 31;
    CGFloat accSwitchW = 49; //系统默认(49,31)
    CGFloat accSwitchY = (contentView_H - accSwitchH)/2;
    CGFloat accSwitchX = contentView_W - margin_hor - accSwitchW; //显示开关时,一定不会显示箭头和accLabel
    self.accSwitch.frame = CGRectMake(accSwitchX, accSwitchY, accSwitchW, accSwitchH);
    
    
    //titleLabel所有的都会变
    CGFloat detailLabelX = self.rowItem.leftImageName ? margin_hor + leftImageW + margin_hor : margin_hor;
    CGFloat detailLabelH = self.rowItem.detailStr ? (contentView_H - 2*margin_ver) * 1/3 : 0.0; //高可能为0
    CGFloat detailLabelY = contentView_H - margin_ver - detailLabelH; //Y可能到达底部分割线位置
    CGFloat detailLabelW = (self.rowItem.accLabelStr || self.rowItem.isShowSwitch) ? contentView_W * 2/3 - detailLabelX : contentView_W - detailLabelX - rightEdgeW; //宽不可能为0
    self.detailLabel.frame = CGRectMake(detailLabelX, detailLabelY, detailLabelW, detailLabelH);

    
    //titleLabel只有Y固定,其他都不固定
    CGFloat titleLabelY = leftImageY;
    CGFloat titleLabelX = detailLabelX;
    CGFloat titleLabelW = detailLabelW;
    CGFloat titleLabelH = contentView_H - 2 * margin_ver - detailLabelH;
    self.titleLabel.frame = CGRectMake(titleLabelX, titleLabelY, titleLabelW, titleLabelH);
    
    //上下分割线frame
    if (self.sectionItem.rowItemsArr.count == 1) { //只有一行,上下分割线都要从0开始
        self.topSeparatorLine.frame = CGRectMake(0, 0, contentView_W, ZW_SeparatorH);
        self.btmSeparatorLine.frame = CGRectMake(0, contentView_H - ZW_SeparatorH, contentView_W, ZW_SeparatorH);
    } else {
        //用户只能设置中间的btm分割线的缩进,每组的最顶部和最底部分割线永远对其最左侧.组内只有一行时,上下分割线顶住最左侧
        self.btmSeparatorLine.frame = CGRectMake(self.sectionItem.separatorLeftOffset, contentView_H -ZW_SeparatorH, contentView_W - self.sectionItem.separatorLeftOffset, ZW_SeparatorH);
        
        if (self.indexPath.row == 0) { //只有组内第一个cell的top分割线有用,其他cell都隐藏着
            self.topSeparatorLine.frame = CGRectMake(0, 0, contentView_W, ZW_SeparatorH);
        }
        
        if(self.indexPath.row == self.sectionItem.rowItemsArr.count -1) {//组内cell有多行时,最后1行底部分割线顶住左边
            self.btmSeparatorLine.frame = CGRectMake(0, contentView_H - ZW_SeparatorH, contentView_W, ZW_SeparatorH);
        }

    }
    
//    //提到最上面
//    [self.contentView bringSubviewToFront:self.topSeparatorLine];
//    [self.contentView bringSubviewToFront:self.btmSeparatorLine];
 
}


@end
