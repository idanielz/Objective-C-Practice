//
//  LoadingViewController.m
//  UpLookingVideoClient
//
//  Created by DanielZ on 14-2-22.
//  Copyright (c) 2014年 DanielZ. All rights reserved.
//

#import "LoadingViewController.h"
#import "Tab1ViewController.h"
#import "Tab2ViewController.h"
#import "ASIFormDataRequest.h"
#import "Model.h"
@interface LoadingViewController ()

@end

@implementation LoadingViewController

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
    //[self.myIndicator startAnimating];
    Model *model = [[Model alloc]init];
    NSString *str = [model getTreeData];
    
    //all video
    NSString *str2 = [model getAllVideo];
    if (str2 == nil || [str2 isEqualToString:@""]) {
        __weak ASIFormDataRequest *request2 = [model buildAllVideoRequest];
        [request2 setCompletionBlock:^{
            NSString *response2 = [request2 responseString];
            [model saveAllVideo:response2];
            [self.myIndicator stopAnimating];
            [self forwardMain];
        }];
        [request2 startAsynchronous];
    }
    
    if (str == nil || [str isEqualToString:@""]) {
        [self.myIndicator startAnimating];
        __weak ASIFormDataRequest *request = [model buildTreeListRequest];
        [request setCompletionBlock:^{
            NSString *response = [request responseString];
            [model saveTreeData:response];
        }];
       [request startAsynchronous];
        

    }else{
        dispatch_async(dispatch_get_main_queue(), ^{
            [self forwardMain];
        });
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)forwardMain
{
    self.tab = [[UITabBarController alloc]init];
    Tab1ViewController *tab1 = [[Tab1ViewController alloc]initWithNibName:@"Tab1ViewController" bundle:nil];
    Tab2ViewController *tab2 = [[Tab2ViewController alloc]initWithNibName:@"Tab2ViewController" bundle:nil];
    self.tab.viewControllers = @[tab1,tab2];
    [NSThread sleepForTimeInterval:1];
    
    [self presentViewController:self.tab animated:YES completion:nil];
    
}

@end
