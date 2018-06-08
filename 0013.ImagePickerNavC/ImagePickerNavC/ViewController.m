//
//  ViewController.m
//  ImagePickerNavC
//
//  Created by iot_iMac on 2018/5/14.
//  Copyright © 2018年 iot_iMac. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UIImagePickerController *navC = [UIImagePickerController new];
    navC.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    navC.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
    //更改导航栏文字颜色和item颜色
    [navC.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor redColor]}];
    [navC.navigationBar setBarTintColor:[UIColor greenColor]];
    [[UIBarButtonItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor yellowColor]} forState:UIControlStateNormal];
    
    [self presentViewController:navC animated:YES completion:nil];
}

@end
