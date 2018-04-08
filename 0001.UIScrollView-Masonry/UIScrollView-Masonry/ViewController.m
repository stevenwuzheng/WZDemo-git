//
//  ViewController.m
//  UIScrollView-Masonry
//
//  Created by wujia121 on 2018/1/28.
//  Copyright © 2018年 steven. All rights reserved.
//

#import "ViewController.h"
#import "Masonry.h"

@interface ViewController ()<UIScrollViewDelegate>
@property (weak, nonatomic) UIScrollView *scrlView;
@property (weak, nonatomic) UIView *leftView;
@property (weak, nonatomic) UIView *rightView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
}


- (void)setupUI {
    
    UIScrollView *scrlView = [[UIScrollView alloc]init];
    scrlView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:scrlView];
    _scrlView = scrlView;
    [scrlView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.offset(0);
    }];
    //scrlView.contentSize = CGSizeMake(self.view.bounds.size.width * 2, 0);
    scrlView.delegate = self;

    UIView *lfView = [UIView new];
    lfView.backgroundColor = [UIColor redColor];
    [scrlView addSubview:lfView];
    _leftView = lfView;
    [lfView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.bottom.offset(0);
        make.width.equalTo(self.view);
        make.height.equalTo(self.view);
    }];
    
    UIView *rgView = [UIView new];
    rgView.backgroundColor = [UIColor greenColor];
    [scrlView addSubview:rgView];
    _rightView = rgView;
    [rgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.right.equalTo(@0);
        make.left.equalTo(lfView.mas_right).offset(20);
        make.width.equalTo(self.view);
        make.height.equalTo(self.view);
    }];
    
    
}

-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    NSLog(@"%s",__FUNCTION__);
}


@end
