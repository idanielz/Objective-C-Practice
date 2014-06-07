//
//  Tab1ViewController.m
//  UpLookingVideoClient
//
//  Created by DanielZ on 14-2-22.
//  Copyright (c) 2014年 DanielZ. All rights reserved.
//

#import "Tab1ViewController.h"
@interface Tab1ViewController ()

@end

@implementation Tab1ViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.tabBarItem.title = @"TAB1";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.splitViewController = [[UISplitViewController alloc]init];
    self.masterViewController = [[MasterViewController alloc]initWithNibName:@"MasterViewController" bundle:nil];
    self.detailViewController = [[DetailViewController alloc]initWithNibName:@"DetailViewController" bundle:nil];
    self.masterNavi = [[UINavigationController alloc]initWithRootViewController:self.masterViewController];
    self.splitViewController.viewControllers = @[self.masterNavi,self.detailViewController];
    [self.view addSubview:self.splitViewController.view];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
