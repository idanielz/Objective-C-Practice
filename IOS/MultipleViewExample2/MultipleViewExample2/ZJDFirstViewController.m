//
//  ZJDFirstViewController.m
//  MultipleViewExample2
//
//  Created by DanielZ on 13-11-23.
//  Copyright (c) 2013年 DanielZ. All rights reserved.
//

#import "ZJDFirstViewController.h"

@interface ZJDFirstViewController ()

@end

@implementation ZJDFirstViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        //self.title = @"fist";
        UITabBarItem *bar = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemBookmarks tag:0];
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
