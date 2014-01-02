//
//  LogoutViewController.m
//  LoginDemo
//
//  Created by DanielZ on 13-12-24.
//  Copyright (c) 2013年 DanielZ. All rights reserved.
//

#import "LogoutViewController.h"

@interface LogoutViewController ()

@end

@implementation LogoutViewController
@synthesize userLabel , user;
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
    NSLog(@"%@",user);
    self.userLabel.text = user;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//- (IBAction)dragBack:(id)sender {
//    //和presentViewController方法对应，返回之前的界面
//    [self dismissViewControllerAnimated:YES completion:nil];
//}

- (IBAction)backToLogin:(id)sender {
    UIAlertView *backToLogin = [[UIAlertView alloc]initWithTitle:@"返回登录" message:@"确定返回登录？\n下次进入程序请重新输入用户名密码!" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
    [backToLogin show];
    
    
}

- (IBAction)deleteAllAccount:(id)sender {
    NSString *tmpPath = NSTemporaryDirectory();
    NSString *userInfoFile = [tmpPath stringByAppendingPathComponent:@"userinfo.plist"];
    //初始化dictionary对象
    NSMutableDictionary *userDict = [[NSMutableDictionary alloc] initWithContentsOfFile:userInfoFile];
    [userDict removeAllObjects];
    [userDict writeToFile:userInfoFile atomically:YES];
    [self dismissViewControllerAnimated:YES completion:nil];

}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    switch (buttonIndex) {
        case 1:{
            [self dismissViewControllerAnimated:YES completion:nil];
            NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
            [userDefaults synchronize];
            [userDefaults removeObjectForKey:@"userInfo"];}
            break;

        default:
            break;
    }
}

- (IBAction)deleteAccount:(id)sender {
    NSString *tmpPath = NSTemporaryDirectory();
    NSString *userInfoFile = [tmpPath stringByAppendingPathComponent:@"userinfo.plist"];
    //初始化dictionary对象
    NSMutableDictionary *userDict = [[NSMutableDictionary alloc] initWithContentsOfFile:userInfoFile];
    [userDict removeObjectForKey:user];
    [userDict writeToFile:userInfoFile atomically:YES];
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)setUsername:(NSString *)name{
    user = name;
}
@end
