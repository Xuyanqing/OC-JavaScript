//
//  ViewController.m
//  JS-OC(1)
//
//  Created by XYQ on 2016/12/16.
//  Copyright © 2016年 XYQ. All rights reserved.
//

#import "ViewController.h"
#import "NextViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *userTextfield;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)loginAction:(id)sender {
    [_userTextfield resignFirstResponder];
    NextViewController *nextVC = [[NextViewController alloc] initWithNibName:@"NextViewController" bundle:nil];
    nextVC.title = @"HTML";
    nextVC.name = _userTextfield.text;
    [self.navigationController pushViewController:nextVC animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
