//
//  NextViewController.m
//  JS-OC(1)
//
//  Created by XYQ on 2016/12/16.
//  Copyright © 2016年 XYQ. All rights reserved.
//

#import "NextViewController.h"
#import <JavaScriptCore/JavaScriptCore.h>

@interface NextViewController ()<UIWebViewDelegate>
@property (weak, nonatomic) IBOutlet UIWebView *loginWebView;

@end

@implementation NextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSURL *htmlPath = [[NSBundle mainBundle] URLForResource:@"login" withExtension:@"html"];
    [_loginWebView loadRequest:[NSURLRequest requestWithURL:htmlPath]];
}

- (void)webViewDidStartLoad:(UIWebView *)webView
{
    
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    // 设置javaScriptContext上下文
    JSContext *jsContext = [_loginWebView valueForKeyPath:@"documentView.webView.mainFrame.javaScriptContext"];
    
    //异常信息
    jsContext.exceptionHandler = ^(JSContext *context, JSValue *exceptionValue) {
        context.exception = exceptionValue;
        NSLog(@"异常信息：%@", exceptionValue);
    };
//    NSLog(@"name === %@",_name);
    
    //oc调用js里面的getusername方法。
    NSString *jsStr = [NSString stringWithFormat:@"getusername('%@')",_name];
    [jsContext evaluateScript:jsStr];


}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
