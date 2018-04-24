//
//  ViewController.m
//  0007. 根据蓝牙信号强度RSSI计算距离
//
//  Created by iot_iMac on 2018/4/18.
//  Copyright © 2018年 iot_iMac. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *txtField;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _txtField.delegate = self;
}


- (float)calcDistByRSSI:(int)rssi
{
    int iRssi = abs(rssi);
    float power = (iRssi-59)/(10*2.0);
    return pow(10, power);
}


- (IBAction)computeAction:(id)sender {
    if(_txtField.text.length < 1) return;
    float dis = [self calcDistByRSSI:_txtField.text.intValue];
    self.txtField.text = [NSString stringWithFormat:@"设备与手机距离(米):%f",dis];
    self.txtField.textColor = [UIColor redColor];
    [self.txtField endEditing:YES];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}


- (void)textFieldDidBeginEditing:(UITextField *)textField {
    textField.text = nil;
    textField.textColor = [UIColor blackColor];
}

-(void)textFieldDidEndEditing:(UITextField *)textField {
    NSLog((@"[文件名:%@]\n" "[函数名:%s]\n" "[行号:%d] \n"), [NSString stringWithFormat:@"%s",__FILE__].lastPathComponent, __FUNCTION__, __LINE__);
}



@end
