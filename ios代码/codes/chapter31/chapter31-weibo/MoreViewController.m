//
//  MoreViewController.m
//  chapter31-weibo
//
//  Created by amaker on 5/8/13.
//  Copyright (c) 2013 amaker. All rights reserved.
//

#import "MoreViewController.h"
#import "ImageUtil.h"

@interface MoreViewController ()

@end

@implementation MoreViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.tabBarItem.title = @"更多";
        
        UIImage *originalImage = [UIImage imageNamed:@"more.png"];
        self.tabBarItem.image = [ImageUtil scaleImage:originalImage andScale:2.0];
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
