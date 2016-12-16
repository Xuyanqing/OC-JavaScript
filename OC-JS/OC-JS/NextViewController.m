//
//  NextViewController.m
//  OC-JS
//
//  Created by XYQ on 2016/12/16.
//  Copyright © 2016年 XYQ. All rights reserved.
//

#import "NextViewController.h"

@interface NextViewController ()
@property (weak, nonatomic) IBOutlet UILabel *showLabel;

@end

@implementation NextViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    _showLabel.text = [NSString stringWithFormat:@"用户名：%@",_username];
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
