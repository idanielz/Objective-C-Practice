//
//  LoginViewController.m
//  LoginDemo
//
//  Created by DanielZ on 13-12-24.
//  Copyright (c) 2013年 DanielZ. All rights reserved.
//

#import "LoginViewController.h"
#import "RegisterViewController.h"
#import "LogoutViewController.h"
#import "ForgetViewController.h"
@interface LoginViewController ()

@end

@implementation LoginViewController
@synthesize accountField, passwordField, userDict, userInfoFile, defaultUserInfo, userDefaults, SetDelegate;
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
    self.title = @"QQ";
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] init];
    backButton.title = @"返回登录";
    self.navigationItem.backBarButtonItem = backButton;
    //导航栏的左按钮
    UIBarButtonItem *leftBarButton = [[UIBarButtonItem alloc]initWithTitle:@"忘记密码" style:UIBarButtonItemStylePlain target:self action:@selector(forgetPassword)];
    //导航栏的右按钮
    UIBarButtonItem *rightBarButton = [[UIBarButtonItem alloc]initWithTitle:@"注册" style:UIBarButtonItemStylePlain target:self action:@selector(registerAccount)];
    //UIViewController有navigationItem的属性，navigationItem有leftBarButtonItem和rightBarButtonItem的属性
    self.navigationItem.leftBarButtonItem = leftBarButton;
    self.navigationItem.rightBarButtonItem = rightBarButton;
    NSString *tmpPath = NSTemporaryDirectory();
    userInfoFile = [tmpPath stringByAppendingPathComponent:@"userinfo.plist"];
    //初始化dictionary对象
    userDict = [[NSMutableDictionary alloc] initWithContentsOfFile:userInfoFile];
    NSLog(@"%@",userInfoFile);
    userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults synchronize];
    NSArray *userArray = [userDefaults arrayForKey:@"userInfo"];
    NSString *username = [userArray objectAtIndex:0];
    NSString *password = [userArray objectAtIndex:1];
    if([password isEqualToString:[userDict valueForKey:username]]){
    //    NSLog(@"username:%@\npassword:%@",username,password);

        LogoutViewController *logoutVC = [[LogoutViewController alloc]initWithNibName:@"LogoutViewController" bundle:nil];

        [self presentViewController:logoutVC animated:YES completion:nil];

    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)login:(id)sender {
    LogoutViewController *logoutVC = [[LogoutViewController alloc]initWithNibName:@"LogoutViewController" bundle:nil];
    //[self.navigationController pushViewController:logoutVC animated:YES];
    //初始化dictionary对象
    userDict = [[NSMutableDictionary alloc] initWithContentsOfFile:userInfoFile];
    NSString *username = accountField.text;
    NSString *password = passwordField.text;
    NSArray *userArray = [userDict allKeys];
    if(![userArray containsObject:username]){
        UIAlertView *notExistAlert = [[UIAlertView alloc] initWithTitle:@"注意" message:@"该用户名不存在，请注册！" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil ,nil];
        [notExistAlert show];
        notExistAlert = nil;
        [passwordField setText:@""];
        [accountField setText:@""];
    }
    else{
        //获取密码信息
        
        //比较用户名 密码是否匹配
        if([password isEqualToString:[userDict valueForKey:username]]){
            //保存用户名 密码数据
            defaultUserInfo = [[NSArray alloc]initWithObjects:username,password, nil];
            //保存数据
            userDefaults = [NSUserDefaults standardUserDefaults];
            [userDefaults setObject:defaultUserInfo forKey:@"userInfo"];
            //跳转到注销页面
            //同级（不具备上下层关系的界面)之间跳转，用 dismissViewControllerAnimated 方法返回
            self.SetDelegate = logoutVC;
            [self.SetDelegate setUsername:username];
            [self presentViewController:logoutVC animated:YES completion:nil];
            
            //accountField.text = nil;
            passwordField.text = nil;
        }
        else{
            UIAlertView *notMatchAlert = [[UIAlertView alloc] initWithTitle:@"错误" message:@"用户名和密码不匹配，请重新输入！" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
            [notMatchAlert show];
            notMatchAlert = nil;
            [passwordField setText:@""];
        }
    }
    
}

- (IBAction)accountEndEdit:(id)sender {
    [passwordField  becomeFirstResponder];
}

- (IBAction)touchBackground:(id)sender {
    [accountField resignFirstResponder];
    [passwordField resignFirstResponder];
}

- (void)forgetPassword{
    ForgetViewController *webView = [[ForgetViewController alloc]initWithNibName:@"ForgetViewController" bundle:nil];
    [self.navigationController pushViewController:webView animated:YES];

}
- (void)registerAccount{
    RegisterViewController *registerVC = [[RegisterViewController alloc]initWithNibName:@"RegisterViewController" bundle:nil];
    [self.navigationController pushViewController:registerVC animated:YES];
}

//- (BOOL)textFieldShouldReturn:(UITextField *)textField{
//    //accountField = (UITextField *)textField;
//    if ([passwordField.text isEqual:@""]){
//        [passwordField  becomeFirstResponder];
//    }
//    else
//    [passwordField  resignFirstResponder];
//    return YES;
//}

@end
