//
//  ZJDViewController.m
//  HelloWorld
//
//  Created by DanielZ on 13-10-24.
//  Copyright (c) 2013年 DanielZ. All rights reserved.
//

#import "ZJDViewController.h"

@interface ZJDViewController ()

@end

@implementation ZJDViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)doBtnHide:(id)sender {
    printf("hello");
    [_lblHelloWorld setHidden:![_lblHelloWorld isHidden]];
    [sender setTitle:[_lblHelloWorld isHidden]
     ? @"Show" : @"Hide" forState:UIControlStateNormal];
}
@end
