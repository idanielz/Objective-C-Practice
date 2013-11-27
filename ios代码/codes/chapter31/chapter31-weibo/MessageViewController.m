//
//  MessageViewController.m
//  chapter31-weibo
//
//  Created by amaker on 5/8/13.
//  Copyright (c) 2013 amaker. All rights reserved.
//

#import "MessageViewController.h"
#import "ImageUtil.h"
@interface MessageViewController ()

@end

@implementation MessageViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.tabBarItem.title = @"消息";
        UIImage *originalImage = [UIImage imageNamed:@"message.png"];
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
