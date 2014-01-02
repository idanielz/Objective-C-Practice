//
//  RegisterViewController.m
//  LoginDemo
//
//  Created by DanielZ on 13-12-24.
//  Copyright (c) 2013年 DanielZ. All rights reserved.
//

#import "RegisterViewController.h"
#import "LoginViewController.h"
@interface RegisterViewController ()

@end

@implementation RegisterViewController
@synthesize accountField,firstPassField,secondPassField,userDict,userInfoFile;
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
    //设置viewController的标题
    self.title = @"注册";
    //plist文件的路径，docPath或者documentPath
    //NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *tmpPath = NSTemporaryDirectory();//[paths objectAtIndex:0];;
    userInfoFile = [tmpPath stringByAppendingPathComponent:@"userinfo.plist"];
    //初始化dictionary对象
    userDict = [[NSMutableDictionary alloc] initWithContentsOfFile:userInfoFile];
    NSLog(@"%@",userInfoFile);
    [accountField becomeFirstResponder];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)registerAccount:(id)sender {
    //LoginViewController *loginVC = [[LoginViewController alloc]init];
    NSString *accountName = accountField.text;
    NSString *firstPassword = firstPassField.text;
    NSString *againPassword = secondPassField.text;
    if ([firstPassword isEqualToString:againPassword]) {
        NSLog(@"%@ %@\n\n",accountField,firstPassword);
        //新增一条用户密码信息，或者修改对应用户的密码
        [userDict setObject: firstPassword forKey:accountName];
        [userDict writeToFile: userInfoFile atomically:YES];
        //出栈，返回上级界面
        [self.navigationController popViewControllerAnimated:YES];
    }
    else{
        UIAlertView *notMatchAlert = [[UIAlertView alloc]initWithTitle:@"错误" message:@"两次输入的密码不一致，请重新输入！"  delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil ];
		[notMatchAlert show];
		notMatchAlert = nil;
    }

}

- (IBAction)finishUsername:(id)sender {
    [firstPassField becomeFirstResponder];
}

- (IBAction)finishFirstPass:(id)sender {
    [secondPassField becomeFirstResponder];
}

- (IBAction)finishRegister:(id)sender {
    [secondPassField resignFirstResponder];
}

@end
