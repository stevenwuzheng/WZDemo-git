//
//  ViewController.m
//  RAC_Test
//
//  Created by wujia121 on 2018/10/6.
//  Copyright © 2018年 wujia121. All rights reserved.
//

#import "ViewController.h"
#import <ReactiveObjC.h>

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *showLB;
@property (weak, nonatomic) IBOutlet UITextField *inputTF;
@property (weak, nonatomic) IBOutlet UIButton *clickMeBtn;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //RAC(_showLB,text) = _inputTF.rac_textSignal;
    
    __weak typeof(self) weakSelf = self;
    [_inputTF.rac_textSignal subscribeNext:^(id  _Nullable x) {
        __strong typeof(self) strongSelf = weakSelf;
        strongSelf.showLB.text = x;
    }];
    
    
    @weakify(self)
    _clickMeBtn.rac_command = [[RACCommand alloc] initWithSignalBlock:^RACSignal * _Nonnull(id  _Nullable input) {
        NSLog(@"%@",input);
        @strongify(self);
        
        self.showLB.backgroundColor = [UIColor cyanColor];
        
        return [RACSignal empty];
    }];
    
    
    [[_clickMeBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
        self.inputTF.backgroundColor = [UIColor redColor];
    }];
    
}

//点击了屏幕的空白处触发这个方法
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"%s",__FUNCTION__);
    self.showLB.text = event.description;
}

//motion是运动,类似摇一摇,只要手机发生运动,内置的加速器和陀螺仪就会检测到,调用下面方法
- (void)motionBegan:(UIEventSubtype)motion withEvent:(UIEvent *)event {
    NSLog(@"%s",__FUNCTION__);
    self.showLB.text = event.description;
}

@end
