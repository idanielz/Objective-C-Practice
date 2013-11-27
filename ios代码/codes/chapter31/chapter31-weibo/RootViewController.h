//
//  AmakerViewController.h
//  chapter31-weibo
//
//  Created by amaker on 5/7/13.
//  Copyright (c) 2013 amaker. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SinaWeibo.h"

#import "HomeViewController.h"
#import "PlaceViewController.h"
#import "MessageViewController.h"
#import "FriendViewController.h"
#import "MoreViewController.h"

@interface RootViewController : UIViewController<SinaWeiboDelegate, SinaWeiboRequestDelegate>
// 登陆方法
- (IBAction)login:(id)sender;
// 跳转
- (void)forward;
// UITabBarController 实例
@property (strong,nonatomic) UITabBarController *myTabController;
// 首页控制器
@property (strong,nonatomic) HomeViewController *homeViewController;
// 广场控制器
@property (strong,nonatomic) PlaceViewController *placeViewController;
// 消息控制器
@property (strong,nonatomic) MessageViewController *messageViewController;
// 好友控制器
@property (strong,nonatomic) FriendViewController *friendViewController;
// 更多控制器
@property (strong,nonatomic) MoreViewController *moreViewController;

@end
