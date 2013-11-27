//
//  PostWeiboViewController.m
//  chapter31-weibo
//
//  Created by amaker on 5/9/13.
//  Copyright (c) 2013 amaker. All rights reserved.
//

#import "PostWeiboViewController.h"
#import "SinaWeibo.h"
#import "SinaWeiboRequest.h"
#import "AmakerAppDelegate.h"

@interface PostWeiboViewController ()

@end

@implementation PostWeiboViewController

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
    // 设置取消微博导航按钮
    UIBarButtonItem *cancelBtnItem = [[UIBarButtonItem alloc]initWithTitle:@"取消" style:UIBarButtonItemStylePlain target:self action:@selector(cancel)];
    self.navigationItem.leftBarButtonItem = cancelBtnItem;
    // 设置写微博导航按钮
    UIBarButtonItem *postBtnItem = [[UIBarButtonItem alloc]initWithTitle:@"发送" style:UIBarButtonItemStylePlain target:self action:@selector(post)];
    self.navigationItem.rightBarButtonItem = postBtnItem;
    // 是UITextView获得焦点
    [self.postTextView becomeFirstResponder];
}

-(void)cancel{
    [self.navigationController popToRootViewControllerAnimated:YES];
}
-(SinaWeibo*)getSinaWeibo{
    AmakerAppDelegate *delegate = (AmakerAppDelegate*)[UIApplication sharedApplication].delegate;
    return delegate.sinaweibo;
}
// 发送微博
- (void)post{
    SinaWeibo *sinaweibo = [self getSinaWeibo];
    NSMutableDictionary *params = [NSMutableDictionary dictionaryWithCapacity:5];
    [params setObject:sinaweibo.accessToken forKey:@"access_token"];
    [params setObject:self.postTextView.text forKey:@"status"];
    
    [sinaweibo requestWithURL:@"statuses/update.json"
                       params:params
                   httpMethod:@"POST"
                     delegate:self];
}

// 实现请求代理方法，获得返回结果
- (void)request:(SinaWeiboRequest *)request didFinishLoadingWithResult:(id)result{
    // NSLog(@"result=%@",result);
    NSDictionary *dic = (NSDictionary*)result;
    NSArray *statuses = [dic objectForKey:@"statuses"];
    NSLog(@"statused=%@",statuses);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
