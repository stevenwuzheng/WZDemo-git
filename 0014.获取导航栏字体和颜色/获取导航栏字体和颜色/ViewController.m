//
//  ViewController.m
//  获取导航栏字体和颜色
//
//  Created by wujia121 on 2018/6/9.
//  Copyright © 2018年 steven. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"首页";
    //---找到1个UILabel:<UILabel: 0x7fde60d0dd50; frame = (0 0; 0 0); text = '首页'; userInteractionEnabled = NO; layer = <_UILabelLayer: 0x60000028d570>> font:<UICTFont: 0x7fde60d13cf0> font-family: ".SFUIText-Semibold"; font-weight: bold; font-style: normal; font-size: 17.00pt family:.SF UI Text fontName:.SFUIText-Semibold
    
    //po [self.navigationController.navigationBar recursiveDescription]
    [self printSubviewsForUIView:self.navigationController.navigationBar];
    
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"%s",__FUNCTION__);
}


- (void)printSubviewsForUIView:(UIView *)view {
    for (UIView *subview in view.subviews) {
        NSLog(@"subView:%@",subview);
        if ([subview isKindOfClass:[UILabel class]]) {
            UIFont *font = [(UILabel*)subview font];
            NSLog(@"---找到1个UILabel:%@ font:%@ family:%@ fontName:%@",subview,font,font.familyName,font.fontName);
        }

        //递归
        if (subview.subviews.count) {
            [self printSubviewsForUIView:subview];
        }

    }
}


/*
2018-06-09 subView:<_UIBarBackground: 0x7f81cfe095d0; frame = (0 0; 375 44); userInteractionEnabled = NO; layer = <CALayer: 0x60400003fb60>>
2018-06-09 subView:<UIImageView: 0x7f81cfe0a2c0; frame = (0 44; 375 0.5); userInteractionEnabled = NO; layer = <CALayer: 0x60400003ffc0>>
2018-06-09 subView:<UIVisualEffectView: 0x7f81cfe0a4f0; frame = (0 0; 375 44); layer = <CALayer: 0x60400003ffe0>>
2018-06-09 subView:<_UIVisualEffectBackdropView: 0x7f81cff136b0; frame = (0 0; 375 44); autoresize = W+H; userInteractionEnabled = NO; layer = <UICABackdropLayer: 0x600000428060>>
2018-06-09 subView:<_UIVisualEffectSubview: 0x7f81cff12860; frame = (0 0; 375 44); autoresize = W+H; userInteractionEnabled = NO; layer = <CALayer: 0x600000428200>>
2018-06-09 subView:<_UINavigationBarLargeTitleView: 0x7f81cfd06e40; frame = (0 0; 0 44); clipsToBounds = YES; hidden = YES; layer = <CALayer: 0x600000220e00>>
2018-06-09 subView:<UILabel: 0x7f81cff0b8c0; frame = (0 0; 0 0); userInteractionEnabled = NO; layer = <_UILabelLayer: 0x60000009c4d0>>
2018-06-09 ---找到1个UILabel:<UILabel: 0x7f81cff0b8c0; frame = (0 0; 0 0); userInteractionEnabled = NO; layer = <_UILabelLayer: 0x60000009c4d0>> font:<UICTFont: 0x7f81cff09480> font-family: ".SFUIText"; font-weight: normal; font-style: normal; font-size: 17.00pt
2018-06-09 subView:<_UINavigationBarContentView: 0x7f81cfe0b170; frame = (0 0; 375 44); layer = <CALayer: 0x604000220040>>
2018-06-09 subView:<UILabel: 0x7f81cff05c10; frame = (0 0; 0 0); text = '首页'; userInteractionEnabled = NO; layer = <_UILabelLayer: 0x600000284100>>
2018-06-09 ---找到1个UILabel:<UILabel: 0x7f81cff05c10; frame = (0 0; 0 0); text = '首页'; userInteractionEnabled = NO; layer = <_UILabelLayer: 0x600000284100>> font:<UICTFont: 0x7f81cff06530> font-family: ".SFUIText-Semibold"; font-weight: bold; font-style: normal; font-size: 17.00pt
2018-06-09 subView:<_UINavigationBarModernPromptView: 0x7f81cff100c0; frame = (0 0; 0 44); alpha = 0; hidden = YES; layer = <CALayer: 0x600000426dc0>>
2018-06-09 subView:<UILabel: 0x7f81cff105e0; frame = (0 25.5; 0 0); text = ''; userInteractionEnabled = NO; layer = <_UILabelLayer: 0x60000009f540>>
2018-06-09 ---找到1个UILabel:<UILabel: 0x7f81cff105e0; frame = (0 25.5; 0 0); text = ''; userInteractionEnabled = NO; layer = <_UILabelLayer: 0x60000009f540>> font:<UICTFont: 0x7f81cff12070> font-family: ".SFUIText"; font-weight: normal; font-style: normal; font-size: 13.00pt
 */

@end
