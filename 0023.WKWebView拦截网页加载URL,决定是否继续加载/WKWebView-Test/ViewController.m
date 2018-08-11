//
//  ViewController.m
//  WKWebView-Test
//
//  Created by iot_iMac on 2018/8/9.
//  Copyright © 2018年 iot_iMac. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()<UIWebViewDelegate>
@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *str = @"https://www.fitbit.com/oauth2/authorize?response_type=code&client_id=22CXFT&redirect_uri=https://aicare.net.cn/aifit/fitbit.html&scope=weight";
    NSURLRequest *req = [NSURLRequest requestWithURL:[NSURL URLWithString:str]];
    [self.webView loadRequest:req];
    self.webView.delegate = self;
}

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
    NSLog(@"---:%s",__FUNCTION__);
    return YES;
}

- (void)webViewDidStartLoad:(UIWebView *)webView {
    NSLog(@"---:%s",__FUNCTION__);
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    NSLog(@"---:%s",__FUNCTION__);
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error {
    NSLog(@"---err:%@",error);

}

@end
