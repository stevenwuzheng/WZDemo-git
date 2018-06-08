//
//  ViewController.m
//  GBPulldownMenu
//
//  Created by iot_iMac on 2018/6/8.
//  Copyright © 2018年 iot_iMac. All rights reserved.
//

#import "ViewController.h"
#import "GBPulldownMenu.h"

@interface ViewController ()

@property (nonatomic, strong) GBPulldownMenu *pulldownMenu;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)add:(id)sender {
    
    if (self.pulldownMenu == nil) {
        
        NSArray *btnTitlesArr = @[@"扫一扫",@"我的二维码",@"邀请好友"];
        NSArray *btnImagesArr = @[@"dis_scan_add_friend_ic",@"dis_my_core_ic",@"dis_invite_friend_ic"];
        
        NSMutableArray *menuItemsArr = [NSMutableArray array];
        for (int i = 0; i < btnImagesArr.count; i++) {
            GBPulldownMenuItem *item = [GBPulldownMenuItem navigationBarMenuItemWithImage:[UIImage imageNamed:btnImagesArr[i]] title:btnTitlesArr[i]];
            [menuItemsArr addObject:item];
        }
        
        self.pulldownMenu = [[GBPulldownMenu alloc] initWithOrigin:CGPointMake(self.view.bounds.size.width - 180 -10, 64) width:180];
        self.pulldownMenu.items = menuItemsArr;
        
        [self.pulldownMenu show];
        
    } else {
        [self.pulldownMenu show];
    }

}

@end
