//
//  AmakerViewController.m
//  chapter31-weibo
//
//  Created by amaker on 5/7/13.
//  Copyright (c) 2013 amaker. All rights reserved.
//

#import "RootViewController.h"
#import "AmakerAppDelegate.h"
@interface RootViewController ()

@end

@implementation RootViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    SinaWeibo *swb = [self getSinaWeibo];
    [swb logIn];
    
    // 实例化UITabBarController
    self.myTabController = [[UITabBarController alloc]init];
    
    // 实例化主页控制器
    self.homeViewController = [[HomeViewController alloc]initWithNibName:@"HomeViewController" bundle:nil];
    // 主页导航控制器
    UINavigationController *homeNav = [[UINavigationController alloc]initWithRootViewController:self.homeViewController];
    // 微博广场控制器
    self.placeViewController = [[PlaceViewController alloc]initWithNibName:@"PlaceViewController" bundle:nil];
    // 广场导航
    UINavigationController *placeNav = [[UINavigationController alloc]initWithRootViewController:self.placeViewController];
    // 好友控制器
    self.friendViewController = [[FriendViewController alloc]initWithNibName:@"FriendViewController" bundle:nil];
    // 广场导航
    UINavigationController *friendNav = [[UINavigationController alloc]initWithRootViewController:self.friendViewController];
    // 消息控制器
    self.messageViewController = [[MessageViewController alloc]initWithNibName:@"MessageViewController" bundle:nil];
    // 消息导航
    UINavigationController *messageNav = [[UINavigationController alloc]initWithRootViewController:self.messageViewController];
    // 更多控制器
    self.moreViewController = [[MoreViewController alloc]initWithNibName:@"MoreViewController" bundle:nil];
    // 更多导航
    UINavigationController *moreNav = [[UINavigationController alloc]initWithRootViewController:self.moreViewController];
    // 为UITabBarController指定控制器集合
    self.myTabController.viewControllers = @[homeNav,messageNav,friendNav,placeNav,moreNav];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)request:(SinaWeiboRequest *)request didFinishLoadingWithResult:(id)result{
    NSLog(@"result=%@",result);
}
// 登陆
- (IBAction)login:(id)sender {
    SinaWeibo *swb = [self getSinaWeibo];
    [swb logIn];
}
// 跳转
-(void)forward{
    [self presentViewController:self.myTabController animated:YES completion:nil];
}
// 删除数据
- (void)removeAuthData
{
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"SinaWeiboAuthData"];
}
// 获得SinaWeibo实例
-(SinaWeibo*)getSinaWeibo{
    AmakerAppDelegate *delegate = (AmakerAppDelegate*)[UIApplication sharedApplication].delegate;
    return delegate.sinaweibo;
}
// 保存数据
- (void)storeAuthData
{
    SinaWeibo *sinaweibo = [self getSinaWeibo];
    NSDictionary *authData = [NSDictionary dictionaryWithObjectsAndKeys:
                              sinaweibo.accessToken, @"AccessTokenKey",
                              sinaweibo.expirationDate, @"ExpirationDateKey",
                              sinaweibo.userID, @"UserIDKey",
                              sinaweibo.refreshToken, @"refresh_token", nil];
    [[NSUserDefaults standardUserDefaults] setObject:authData forKey:@"SinaWeiboAuthData"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}
// 登陆成功
-(void)sinaweiboDidLogIn:(SinaWeibo *)sinaweibo{
    NSLog(@"%msg=%@",sinaweibo);
    // 保存用户数据到本地
    [self storeAuthData];
    // 跳转到主页
    [self forward];
}

@end
