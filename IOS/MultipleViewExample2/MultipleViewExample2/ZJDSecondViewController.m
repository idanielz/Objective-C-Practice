//
//  ZJDSecondViewController.m
//  MultipleViewExample2
//
//  Created by DanielZ on 13-11-23.
//  Copyright (c) 2013年 DanielZ. All rights reserved.
//

#import "ZJDSecondViewController.h"

@interface ZJDSecondViewController ()

@end

@implementation ZJDSecondViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        //self.tabBarItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemContacts tag:0];
        UIImage *img = [UIImage imageNamed:@"123.png"];
        UITabBarItem *bar = [[UITabBarItem alloc] initWithTitle:@"haha" image:img tag:0];
        self.tabBarItem = bar;
}
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
