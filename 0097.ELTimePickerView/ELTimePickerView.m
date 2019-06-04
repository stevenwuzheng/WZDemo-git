//
//  ELTimePickerView.m
//  Elink
//
//  Created by iot_user on 2019/3/5.
//  Copyright © 2019年 iot_iMac. All rights reserved.
//

#import "ELTimePickerView.h"
#import "XJHDevTools.h"



//#define ELBlueColor             ColorFromHexa(0x00aeff)
#define ELBlueColor             ColorFromHexa(0x000000)
#define EL242GrayColor          ColorFromHexa(0xf2f2f2)
#define EL220GrayColor          ColorFromHexa(0xdcdcdc)
#define EL180GrayColor          ColorFromHexa(0xb4b4b4)
#define EL60GrayColor           ColorFromHexa(0x3c3c3c)
#define ELBlackColor            ColorFromHexa(0x000000)


@interface ELTimePickerView()<UIPickerViewDelegate,UIPickerViewDataSource>
@property (nonatomic, weak) UIView *pickerBackView;

@property (nonatomic, weak) UIPickerView *pickerView;

@property (nonatomic, weak) UILabel *titleLB;

@property (nonatomic, copy)NSMutableArray * dataSource;
@end


@implementation ELTimePickerView
-(NSMutableArray *)dataSource{
    if (_dataSource == nil) {
        _dataSource = [[NSMutableArray alloc]init];
    }
    return _dataSource;
}
- (void)setTitle:(NSString *)title {
    _title = title;
    _titleLB.text = title;
}
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self createUI];
    }
    return self;
}
-(void)createData{
    //年
    NSMutableArray * years = [[NSMutableArray alloc]init];
    struct YMDStruct strct = [XJHDevTools getYMD:0];
    NSInteger nowYear = strct.year;
    for (int i=BeginYear; i<=nowYear; i++) {
        [years addObject:@(i)];
    }
    //月
    NSMutableArray * months = [[NSMutableArray alloc]init];
    NSInteger nowMonth = strct.month;
    if (self.selectYear != nowYear) {
        for (int i=1; i<=12; i++) {
            [months addObject:@(i)];
        }
    }else{
        for (int i=1; i<=nowMonth; i++) {
            [months addObject:@(i)];
        }
    }
    
    //日
    NSMutableArray * days = [[NSMutableArray alloc]init];
    NSInteger nowDay = strct.day;
    if (self.selectYear == nowYear && self.selectMonth == nowMonth) {
        for (int i=1; i<=nowDay; i++) {
            [days addObject:@(i)];
        }
    }else{
        NSInteger day = [XJHDevTools daysCountOfMonth:self.selectMonth andYear:self.selectYear];
        for (int i=1; i<=day; i++) {
            [days addObject:@(i)];
        }
    }
    if (self.dataSource.count == 0) {
        [self.dataSource addObject:years];
        [self.dataSource addObject:months];
        [self.dataSource addObject:days];
    }else if (self.dataSource.count == 1){
        [self.dataSource replaceObjectAtIndex:0 withObject:years];
        [self.dataSource addObject:months];
        [self.dataSource addObject:days];
    }else if (self.dataSource.count == 2){
        [self.dataSource replaceObjectAtIndex:0 withObject:years];
        [self.dataSource replaceObjectAtIndex:1 withObject:months];
        [self.dataSource addObject:days];
    }else{
        [self.dataSource replaceObjectAtIndex:0 withObject:years];
        [self.dataSource replaceObjectAtIndex:1 withObject:months];
        [self.dataSource replaceObjectAtIndex:2 withObject:days];
    }
    //
    [self.pickerView reloadAllComponents];
    //
    [self.pickerView selectRow:self.selectYear-BeginYear inComponent:0 animated:YES];
    //
    if (self.selectMonth > months.count) {
        self.selectMonth = months.count;
    }
    [self.pickerView selectRow:self.selectMonth-1 inComponent:1 animated:YES];
    //
    if (self.selectDay > days.count) {
        self.selectDay = days.count;
    }
    [self.pickerView selectRow:self.selectDay-1 inComponent:2 animated:YES];
    
}
- (void)createUI {
    self.backgroundColor = [EL60GrayColor colorWithAlphaComponent:0.7];
    
    UIView *pickerBackView = [[UIView alloc] init];
    pickerBackView.backgroundColor = EL242GrayColor;
    [self addSubview:pickerBackView];
    [pickerBackView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.right.offset(0);
        make.height.equalTo(self).multipliedBy(0.4);
    }];
    
    UIPickerView *picker = [[UIPickerView alloc] init];
    picker.showsSelectionIndicator = YES;
    [pickerBackView addSubview:picker];
    picker.dataSource = self;
    picker.delegate = self;
    [picker mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(10);
        make.right.offset(-10);
        make.top.bottom.offset(0);
    }];
    self.pickerView = picker;
    
    CGFloat titleHeight = 44;
    
    
    UIButton *closeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [closeBtn setImage:[UIImage imageNamed:@"edit_cancel_bt"] forState:UIControlStateNormal];
    [closeBtn addTarget:self action:@selector(closeBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [pickerBackView addSubview:closeBtn];
    [closeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.offset(0);
        make.width.height.mas_equalTo(titleHeight);
    }];
    

    UIButton *okBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [okBtn setImage:[UIImage imageNamed:@"edit_ok_bt"] forState:UIControlStateNormal];
    [okBtn addTarget:self action:@selector(okBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [pickerBackView addSubview:okBtn];
    [okBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.top.offset(0);
        make.width.height.mas_equalTo(titleHeight);
    }];
    

    UILabel *titleLB = [[UILabel alloc] initWithFrame:CGRectZero];
    titleLB.textAlignment = NSTextAlignmentCenter;
    titleLB.numberOfLines = 0;
    titleLB.adjustsFontSizeToFitWidth = YES;
    titleLB.text = @"";
    titleLB.textColor = EL60GrayColor;
    titleLB.font = [UIFont systemFontOfSize:16];
    [pickerBackView addSubview:titleLB];
    [titleLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(0);
        make.left.equalTo(closeBtn.mas_right);
        make.right.equalTo(okBtn.mas_left);
        make.height.mas_equalTo(titleHeight);
    }];
    _titleLB = titleLB;
    
    UIView *line = [UIView new];
    line.backgroundColor = EL180GrayColor;
    [pickerBackView addSubview:line];
    [line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(titleLB.mas_bottom).offset(0);
        make.left.offset(10);
        make.right.offset(-10);
        make.height.mas_equalTo(0.5);
    }];
    
    
}


#pragma mark ============ 点击事件 ==============
- (void)closeBtnClick {
    [self removeFromSuperview];
    
}

- (void)okBtnClick {
    if (self.selectBlock) {
        
        self.selectBlock(self.selectYear,self.selectMonth,self.selectDay);
    }
    
    [self removeFromSuperview];
    
}



- (void)showInView:(UIView *)view {
    if (self.selectYear && self.selectMonth && self.selectDay) {
        [view addSubview:self];
        self.frame = view.bounds;
        [self createData];
    }else{
        NSLog(@"请设置selectYear，selectMonth，selectDay的值");
    }
}

#pragma mark ============ 数据源 ==============
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return self.dataSource.count;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    NSArray *rowsArr = self.dataSource[component];
    return rowsArr.count;
}

#pragma mark ============ 代理 ==============
//- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
//    NSArray *rowsArr = self.dataSource[component];
//    NSString *title = rowsArr[row];
//    return title;
//}

//- (NSAttributedString *)pickerView:(UIPickerView *)pickerView attributedTitleForRow:(NSInteger)row forComponent:(NSInteger)component {
//
//    NSArray *rowsArr = self.dataSource[component];
//    NSString *title = rowsArr[row];
//
//    NSAttributedString *attrTxt = nil;
//
//    NSInteger selRowIndex = [pickerView selectedRowInComponent:component];
//    if (row == selRowIndex) {
//        attrTxt = [[NSAttributedString alloc] initWithString:title attributes:@{
//                                                                                NSForegroundColorAttributeName:ELBlueColor,
//                                                                                NSFontAttributeName:FONT(13)
//                                                                                }];
//    } else {
//        attrTxt = [[NSAttributedString alloc] initWithString:title attributes:@{
//                                                                                NSForegroundColorAttributeName:EL180GrayColor,
//                                                                                NSFontAttributeName:FONT(13)
//                                                                                }];
//    }
//
//    for (UIView *vw in self.pickerView.subviews) {
//        if (vw.frame.size.height < 1) { //2条线的默认高度为0.5
//            vw.backgroundColor = EL180GrayColor;
//        }
//    }
//
//    return attrTxt;
//
//}

- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view {
    
    UILabel *lb = (UILabel *)view;
    if (lb == nil) {
        lb = [[UILabel alloc] init];
        lb.font = [UIFont systemFontOfSize:18];
        lb.numberOfLines = 1;
        lb.adjustsFontSizeToFitWidth = YES;
        lb.textAlignment = NSTextAlignmentCenter;
    }
    //给lb赋值
    NSArray *rowsArr = self.dataSource[component];
    NSNumber *num = rowsArr[row];
    lb.text = [NSString stringWithFormat:@"%.2d",[num intValue]];
    
    //为当前选中添加颜色
    NSInteger selRowIndex;
    if (component == 0) {
        selRowIndex = self.selectYear - BeginYear;
    }else if (component == 1){
        selRowIndex = self.selectMonth - 1;
    }else{
        selRowIndex = self.selectDay - 1;
    }

    if (row == selRowIndex) {
        lb.textColor = ELBlueColor;
    } else {
        lb.textColor = EL180GrayColor;
    }
    
    for (UIView *vw in self.pickerView.subviews) {
        if (vw.frame.size.height < 1) { //2条线的默认高度为0.5
            vw.backgroundColor = EL180GrayColor;
        }
    }
    
    return lb;
}



- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component {
    return 100;
}

- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component {
    return 40;
}

//MARK:点击事件
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    NSArray *array = self.dataSource[component];
    if (component == 0) {
        self.selectYear = [array[row] integerValue];
        [self createData];
    }else if (component == 1){
        self.selectMonth = [array[row] integerValue];
        [self createData];
    }else if (component == 2){
        self.selectDay = [array[row] integerValue];
    }
    [pickerView reloadComponent:component]; //调用这句,才会让选中的cell显示蓝色
}


@end
