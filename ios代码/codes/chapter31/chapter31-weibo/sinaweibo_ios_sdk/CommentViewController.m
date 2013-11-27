//
//  CommentViewController.m
//  chapter31-weibo
//
//  Created by amaker on 5/10/13.
//  Copyright (c) 2013 amaker. All rights reserved.
//

#import "CommentViewController.h"
#import "AmakerAppDelegate.h"

@interface CommentViewController ()

@end

@implementation CommentViewController

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
    UIBarButtonItem *right = [[UIBarButtonItem alloc]initWithTitle:@"评论" style:UIBarButtonItemStyleBordered target:self action:@selector(comment)];
    self.navigationItem.rightBarButtonItem = right;
    [self.commentTextView becomeFirstResponder];
}

// 获得SinaWeibo对象
-(SinaWeibo*)getSinaWeibo{
    AmakerAppDelegate *delegate = (AmakerAppDelegate*)[UIApplication sharedApplication].delegate;
    return delegate.sinaweibo;
}


// 发出评论
- (void)comment {
    SinaWeibo *sinaweibo = [self getSinaWeibo];
    NSMutableDictionary *param = [NSMutableDictionary dictionaryWithCapacity:3];
    [param setObject:sinaweibo.accessToken forKey:@"access_token"];
    [param setObject:self.sid forKey:@"id"];
    [param setObject:self.commentTextView.text forKey:@"comment"];
    [sinaweibo requestWithURL:@"comments/create.json"
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
