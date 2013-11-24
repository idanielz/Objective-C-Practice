//
//  ZJDFirstViewController.m
//  MultipleViewExample
//
//  Created by DanielZ on 13-11-23.
//  Copyright (c) 2013年 DanielZ. All rights reserved.
//

#import "ZJDFirstViewController.h"
#import "ZJDSecondViewController.h"

@interface ZJDFirstViewController ()

@end

@implementation ZJDFirstViewController

-(IBAction)pushMe:(id)sender
{
    ZJDSecondViewController *svc = [[ZJDSecondViewController alloc] init];
    [self.navigationController pushViewController:svc animated:YES];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title=@"Fisr View";
    UIBarButtonItem *backBar = [[UIBarButtonItem alloc] init];
    backBar.title = @"1back file";
    self.navigationItem.backBarButtonItem = backBar;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
