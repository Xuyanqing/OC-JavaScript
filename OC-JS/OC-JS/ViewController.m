//
//  ViewController.m
//  OC-JS
//
//  Created by XYQ on 2016/12/16.
//  Copyright © 2016年 XYQ. All rights reserved.
//

#import "ViewController.h"
#import <JavaScriptCore/JavaScriptCore.h>
#import "JSObjectMethods.h"
#import "NextViewController.h"

@interface ViewController ()<UIWebViewDelegate,JSObjectMethods>

@property (weak, nonatomic) IBOutlet UIWebView *loginWebView;
@property (strong, nonatomic) JSContext *jsContext;
@end

@implementation ViewController

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
    self.jsContext = [_loginWebView valueForKeyPath:@"documentView.webView.mainFrame.javaScriptContext"];
    
    //将test对象指向自身，名字可以随便起，但是这里的名字要与js里的一致。
    self.jsContext[@"test"] = self;
    
    //异常信息
    self.jsContext.exceptionHandler = ^(JSContext *context, JSValue *exceptionValue) {
        context.exception = exceptionValue;
        NSLog(@"异常信息：%@", exceptionValue);
    };
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    NSLog(@"load fail!");
}

//登录
- (void)loginApp:(NSString *)name
{
    NSLog(@"name = %@",name);
    
    /*
    *在键盘弹出的情况下，需要回到主线程,否则跳转异常。
    *最好先把键盘收起，之后在跳转。这样在返回页面的时候，就不会看见空白的页面。
    */
    dispatch_async(dispatch_get_main_queue(), ^{
        NextViewController *nextVC = [[NextViewController alloc] initWithNibName:@"NextViewController" bundle:nil];
        nextVC.title = @"获取用户名";
        nextVC.username = name;
        [self.navigationController pushViewController:nextVC animated:YES];
    });
}

//弹框
- (void)showAlertView
{
    //在键盘弹出的情况下，需要回到主线程,否则会抛异常
    dispatch_async(dispatch_get_main_queue(), ^{

        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"OC的弹框" message:@"js调用OC的方法!" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *cancel  =[UIAlertAction actionWithTitle:@"关闭" style:UIAlertActionStyleCancel handler:nil];
        [alertController addAction:cancel];
        [self presentViewController:alertController animated:YES completion:nil];
    });
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end;
