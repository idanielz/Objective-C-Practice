//
//  RepostViewController.m
//  chapter31-weibo
//
//  Created by amaker on 5/10/13.
//  Copyright (c) 2013 amaker. All rights reserved.
//

#import "RepostViewController.h"
#import "AmakerAppDelegate.h"

@interface RepostViewController ()

@end

@implementation RepostViewController

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
    // 转发导航按钮
    UIBarButtonItem *right = [[UIBarButtonItem alloc]initWithTitle:@"转发" style:UIBarButtonItemStyleBordered target:self action:@selector(repost)];
    self.navigationItem.rightBarButtonItem = right;
    // 内容框获得焦点
    [self.repostTextView becomeFirstResponder];
}

// 获得SinaWeibo对象
-(SinaWeibo*)getSinaWeibo{
    AmakerAppDelegate *delegate = (AmakerAppDelegate*)[UIApplication sharedApplication].delegate;
    return delegate.sinaweibo;
}


// 转发
- (void)repost {
    SinaWeibo *sinaweibo = [self getSinaWeibo];
    NSMutableDictionary *param = [NSMutableDictionary dictionaryWithCapacity:3];
    [param setObject:sinaweibo.accessToken forKey:@"access_token"];
    [param setObject:self.sid forKey:@"id"];
    [param setObject:self.repostTextView.text forKey:@"status"];
    [sinaweibo requestWithURL:@"statuses/repost.json"
                       params:param
                   httpMethod:@"POST"
                     delegate:self];
}

// 获得请求结果
- (void)request:(SinaWeiboRequest *)request didFinishLoadingWithResult:(id)result{
    NSDictionary *dic = (NSDictionary*)result;
   // NSArray *commnts = [dic objectForKey:@"comments"];
    NSLog(@"dic=%@",dic);
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
