//
//  WeiboDetailViewController.m
//  chapter31-weibo
//
//  Created by amaker on 5/10/13.
//  Copyright (c) 2013 amaker. All rights reserved.
//

#import "WeiboDetailViewController.h"
#import "ASIHTTPRequest.h"
#import "ASIDownloadCache.h"
#import <QuartzCore/QuartzCore.h>
#import "SDSegmentedControl.h"
#import "AmakerAppDelegate.h"
#import "ASIDownloadCache.h"
#import "RepostViewController.h"
#import "CommentViewController.h"
#import "SGInfoAlert.h"

@interface WeiboDetailViewController ()

@end

@implementation WeiboDetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
// 显示转发、评论、收藏弹出框
-(void)showActionSheet{
    UIActionSheet *actions = [[UIActionSheet alloc]initWithTitle:nil delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:@"转发" otherButtonTitles:@"评论", @"收藏",nil];
    [actions showInView:self.view];
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    NSString *title = [actionSheet buttonTitleAtIndex:buttonIndex];
    if ([title isEqualToString:@"转发"]) {
         [self forwardToRepost];
    }
    if ([title isEqualToString:@"评论"]) {
        [self forwardToComment];
    }
    if ([title isEqualToString:@"收藏"]) {
        [self doFavor];
    }
}

// 收藏
-(void)doFavor{
    SinaWeibo *sinaweibo = [self getSinaWeibo];
    NSMutableDictionary *param = [NSMutableDictionary dictionaryWithCapacity:3];
    [param setObject:sinaweibo.accessToken forKey:@"access_token"];
    [param setObject:self.sid forKey:@"id"];
    
    [sinaweibo requestWithURL:@"favorites/create.json"
                       params:param
                   httpMethod:@"POST"
                     delegate:self];
}

// 跳转到评论
-(void)forwardToComment{
    CommentViewController *cvc = [[CommentViewController alloc]initWithNibName:@"CommentViewController" bundle:nil];
    cvc.sid = self.sid;
    [self.navigationController pushViewController:cvc animated:YES];
}

// 跳转到转发
-(void)forwardToRepost{
    NSLog(@"here.......");
    RepostViewController *rvc = [[RepostViewController alloc]initWithNibName:@"RepostViewController" bundle:nil];
    rvc.sid = self.sid;
    [self.navigationController pushViewController:rvc animated:YES];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // 隐藏TabBar
    self.tabBarController.tabBar.hidden = YES;
    
    // 显示转发、评论、收藏弹出框
    UIBarButtonItem *action = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAction target:self action:@selector(showActionSheet)];
    self.navigationItem.rightBarButtonItem = action;

    // 评论数据源
    self.commentDataSource = [NSMutableArray arrayWithCapacity:5];
    // 转发数据源
    self.repostDataSource = [NSMutableArray arrayWithCapacity:6];
    
    self.commentTv = [[UITableView alloc]initWithFrame:CGRectZero];
    self.commentTv.dataSource = self;
    self.commentTv.delegate = self;
    
    self.repostTv = [[UITableView alloc]initWithFrame:CGRectZero];
    self.repostTv.dataSource = self;
    self.repostTv.delegate = self;

    // 用户信息
    NSDictionary *userDic = [self.weiboContentDic objectForKey:@"user"];
    // 1. 头像
    NSString *profile_image_url = [userDic objectForKey:@"profile_image_url"];
    NSURL *photoURL = [NSURL URLWithString:profile_image_url];
    __weak ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:photoURL];
    
    [request setDownloadCache:[ASIDownloadCache sharedCache]];
    [request setCompletionBlock:^{
        NSData *responseData = [request responseData];
        UIImage *tempImage = [UIImage imageWithData:responseData];
        self.profileImageView = [[UIImageView alloc]initWithImage:tempImage];
        
        //[self.profileImageView.layer setBorderColor: [[UIColor whiteColor] CGColor]];
        [[self.profileImageView layer] setBorderWidth:2.0f];
        self.profileImageView.layer.cornerRadius = 5;
        self.profileImageView.frame = CGRectMake(5, 5, self.profileImageView.frame.size.width,  self.profileImageView.frame.size.height);
        // NSLog(@"w=%f",self.profileImageView.frame.size.width);
        [self.view addSubview:self.profileImageView];
        
        [self.view setNeedsLayout];
    }];
    [request startAsynchronous];
    // 2. 用户名称
    NSString *username = [userDic objectForKey:@"name"];
    self.usernameLabel = [[UILabel alloc]initWithFrame:CGRectZero];
    CGRect usernameFrame = CGRectMake(60, 5, 100, 21);
    self.usernameLabel.frame = usernameFrame;
    self.usernameLabel.text = username;
    self.usernameLabel.font = [UIFont systemFontOfSize:12];
    [self.view addSubview:self.usernameLabel];

    // 3. 分割线
    CGRect lintViewFrame = CGRectMake(0, 70, 320, 1);
    UIView *lineView = [[UIView alloc]initWithFrame:lintViewFrame];
    lineView.backgroundColor = [UIColor blackColor];
    [self.view addSubview:lineView];
    
    // 4. 微博信息
    NSString *text = [self.weiboContentDic objectForKey:@"text"];
    CGSize constraint = CGSizeMake(320 - (10 * 2), 20000.0f);
    CGSize size = [text sizeWithFont:[UIFont systemFontOfSize:12] constrainedToSize:constraint lineBreakMode:NSLineBreakByWordWrapping];
    self.myTextLabel = [[UILabel alloc]initWithFrame:CGRectZero];
    self.myTextLabel.frame = CGRectMake(10, 75, size.width-20, size.height);
    self.myTextLabel.numberOfLines = 0;
    self.myTextLabel.lineBreakMode = NSLineBreakByWordWrapping;
    self.myTextLabel.font = [UIFont systemFontOfSize:12];
    self.myTextLabel.text = text;
    [self.view addSubview:self.myTextLabel];
    
    __block SDSegmentedControl *sc;
    
    // 5. 图片
    NSString *thumbnail_pic = [self.weiboContentDic objectForKey:@"thumbnail_pic"];
    if (thumbnail_pic!=nil&&[thumbnail_pic length]>0) {
        NSURL *thumbnail_picURL = [NSURL URLWithString:thumbnail_pic];
        request = [ASIHTTPRequest requestWithURL:thumbnail_picURL];
        __block UIImage *tempImage;
        [request setDownloadCache:[ASIDownloadCache sharedCache]];
        [request setCompletionBlock:^{
            NSData *responseData = [request responseData];
            tempImage = [UIImage imageWithData:responseData];
            self.picImageView = [[UIImageView alloc]initWithImage:tempImage];
            self.picImageView.frame = CGRectMake(60, size.height+80, tempImage.size.width, tempImage.size.height);
            [self.view addSubview:self.picImageView];
            
            // 6. 转发和评论 根据文字和图片高度计算分段控件的位置
            CGRect scFrame = CGRectMake(0, size.height+self.picImageView.frame.size.height+80, 320, 44);
            NSArray *items = @[@"转发",@"评论"];
            sc = [[SDSegmentedControl alloc]initWithItems:items];
            sc.backgroundColor = [UIColor clearColor];
            sc.frame = scFrame;
            [self.view addSubview:sc];
            [sc addTarget:self action:@selector(change:) forControlEvents:UIControlEventValueChanged];
            
            sc.selectedSegmentIndex = 0;
            
            // 容器视图
            CGRect containerFrame = CGRectMake(0, size.height+self.picImageView.frame.size.height+80+44, 320, 300);
            self.containerView = [[UIView alloc]initWithFrame:containerFrame];
           // self.containerView.backgroundColor = [UIColor redColor];
            [self.view addSubview:self.containerView];
            
            // 评论表
            CGRect commentTvFrame = CGRectMake(0, 0, 320, 300);
            self.commentTv.frame = commentTvFrame;
            //[self.containerView addSubview:self.commentTv];
            
            // 转发表
            CGRect repostTvFrame = CGRectMake(0, 0, 320, 300);
            self.commentTv.frame = repostTvFrame;
            //[self.containerView addSubview:self.commentTv];
            [self.containerView addSubview:self.repostTv];
            self.currentTv = self.repostTv;
    
        }];
    [request startAsynchronous];
    }else{
        // 如果没有图片，根据文字高度计算分段控件的位置
        CGRect scFrame = CGRectMake(0, size.height+80, 320, 44);
        NSArray *items = @[@"转发",@"评论"];
        sc = [[SDSegmentedControl alloc]initWithItems:items];
        sc.backgroundColor = [UIColor clearColor];
        sc.frame = scFrame;
        [self.view addSubview:sc];
        [sc addTarget:self action:@selector(change:) forControlEvents:UIControlEventValueChanged];
         sc.selectedSegmentIndex = 0;
        
        // 容器视图
        CGRect containerFrame = CGRectMake(0, size.height+80+44, 320, 300);
        self.containerView = [[UIView alloc]initWithFrame:containerFrame];
        self.containerView.backgroundColor = [UIColor redColor];
        [self.view addSubview:self.containerView];
        
        // 评论表
        CGRect commentTvFrame = CGRectMake(0, 0, 320, 300);
        self.commentTv.frame = commentTvFrame;
        //[self.containerView addSubview:self.commentTv];
        
        // 转发表
        CGRect repostTvFrame = CGRectMake(0, 0, 320, 300);
        self.repostTv.frame = repostTvFrame;
        [self.containerView addSubview:self.repostTv];
        self.currentTv = self.repostTv;
    }
    // 6. 加载转发和评论数据
    NSString *sid = [self.weiboContentDic objectForKey:@"idstr"];
    NSLog(@"sid=%@",sid);
    [self loadComment:sid];
    [self loadRepost:sid];
    
    // 设置当前微博id
    self.sid = sid;
    
}

// 表的行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    // 评论表
    if ([tableView isEqual:self.commentTv]) {
        NSLog(@"count=%d",[self.commentDataSource count]);
        return [self.commentDataSource count];
    }
    // 转发表
    if ([tableView isEqual:self.repostTv]) {
        NSLog(@"count----------=%d",[self.repostDataSource count]);
        return [self.repostDataSource count];
    }
    return 0;
}
// 表行
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    // 评论行
    if ([tableView isEqual:self.commentTv]) {
        static NSString *cid = @"cid";
        UITableViewCell *cCell = [tableView dequeueReusableCellWithIdentifier:cid];
        if (cCell==nil) {
            cCell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cid];
        }
        
        NSDictionary *dic = [self.commentDataSource objectAtIndex:indexPath.row];
        NSDictionary *userDic = [dic objectForKey:@"user"];
        // 用户名称
        NSString *name = [userDic objectForKey:@"name"];
        cCell.textLabel.text = name;
        cCell.textLabel.font = [UIFont systemFontOfSize:10];
        // 用户头像
        NSString *profile_image_urlStr = [userDic objectForKey:@"profile_image_url"];
        
        NSURL *profile_image_url = [NSURL URLWithString:profile_image_urlStr];
        __weak ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:profile_image_url];
        __block UIImage *tempImage;
        [request setDownloadCache:[ASIDownloadCache sharedCache]];
        [request setCompletionBlock:^{
            NSData *responseData = [request responseData];
            tempImage = [UIImage imageWithData:responseData];
            cCell.imageView.image = tempImage;
            [cCell setNeedsLayout];
        }];
        [request startAsynchronous];
        //评论内容
        NSString *text = [dic objectForKey:@"text"];
        cCell.detailTextLabel.text = text;
        cCell.detailTextLabel.font = [UIFont systemFontOfSize:8];
        
        return cCell;
    }
    // 转发行
    if ([tableView isEqual:self.repostTv]) {
        static NSString *rid = @"rid";
        UITableViewCell *rCell = [tableView dequeueReusableCellWithIdentifier:rid];
        if (rCell==nil) {
            rCell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:rid];
        }
        
        NSDictionary *dic = [self.repostDataSource objectAtIndex:indexPath.row];
        NSDictionary *userDic = [dic objectForKey:@"user"];
        // 用户名称
        NSString *name = [userDic objectForKey:@"name"];
        rCell.textLabel.text = name;
        rCell.textLabel.font = [UIFont systemFontOfSize:10];
        // 用户头像
        NSString *profile_image_urlStr = [userDic objectForKey:@"profile_image_url"];
        
        NSURL *profile_image_url = [NSURL URLWithString:profile_image_urlStr];
        __weak ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:profile_image_url];
        __block UIImage *tempImage;
        [request setDownloadCache:[ASIDownloadCache sharedCache]];
        [request setCompletionBlock:^{
            NSData *responseData = [request responseData];
            tempImage = [UIImage imageWithData:responseData];
            rCell.imageView.image = tempImage;
            [rCell setNeedsLayout];
        }];
        [request startAsynchronous];
        //评论内容
        NSString *text = [dic objectForKey:@"text"];
        rCell.detailTextLabel.text = text;
        rCell.detailTextLabel.font = [UIFont systemFontOfSize:8];
        
        return rCell;
    }
    
    return nil;
}
// 分段切换事件
-(void)change:(UISegmentedControl*)sender{
    int index = sender.selectedSegmentIndex;
    [self.currentTv removeFromSuperview];
    switch (index) {
        case 0:
            [self.containerView addSubview:self.repostTv];
            self.currentTv = self.repostTv;
            break;
        case 1:
            [self.containerView addSubview:self.commentTv];
            self.currentTv = self.commentTv;
            break;
        default:
            break;
    }
}

// 获得SinaWeibo对象
-(SinaWeibo*)getSinaWeibo{
    AmakerAppDelegate *delegate = (AmakerAppDelegate*)[UIApplication sharedApplication].delegate;
    return delegate.sinaweibo;
}

// 加载评论
- (void)loadComment:(NSString*)sid {
    SinaWeibo *sinaweibo = [self getSinaWeibo];
    NSMutableDictionary *param = [NSMutableDictionary dictionaryWithCapacity:3];
    [param setObject:sinaweibo.accessToken forKey:@"access_token"];
    [param setObject:sid forKey:@"id"];
    
    [sinaweibo requestWithURL:@"comments/show.json"
                       params:param
                   httpMethod:@"GET"
                     delegate:self];
}
// 加载转发
- (void)loadRepost:(NSString*)sid {
    SinaWeibo *sinaweibo = [self getSinaWeibo];
    NSMutableDictionary *param = [NSMutableDictionary dictionaryWithCapacity:3];
    [param setObject:sinaweibo.accessToken forKey:@"access_token"];
    [param setObject:sid forKey:@"id"];
    [sinaweibo requestWithURL:@"statuses/repost_timeline.json"
                       params:param
                   httpMethod:@"GET"
                     delegate:self];
}

// 获得请求结果
- (void)request:(SinaWeiboRequest *)request didFinishLoadingWithResult:(id)result{
    // 判断是评论还是转发
    if ([request.url hasSuffix:@"comments/show.json"]){
        NSDictionary *dic = (NSDictionary*)result;
        NSArray *commnts = [dic objectForKey:@"comments"];
        NSLog(@"comments=%@",commnts);
        [self.commentDataSource removeAllObjects];
        [self.commentDataSource addObjectsFromArray:commnts];
        [self.commentTv reloadData];
    // 转发
    }else if([request.url hasSuffix:@"statuses/repost_timeline.json"]){
        NSDictionary *dic = (NSDictionary*)result;
        NSArray *reposts = [dic objectForKey:@"reposts"];
        NSLog(@"reposts=%@",reposts);
        [self.repostDataSource removeAllObjects];
        [self.repostDataSource addObjectsFromArray:reposts];
        [self.repostTv reloadData];
    // 收藏
    }else if([request.url hasSuffix:@"favorites/create.json"]){
        NSDictionary *dic = (NSDictionary*)result;
        NSDictionary *status = [dic objectForKey:@"status"];
        NSString *favor = [status objectForKey:@"favorited"];
        if ([favor boolValue]) {
            [SGInfoAlert showInfo:@"收藏成功!" bgColor:nil inView:self.view vertical:100];
           //  NSLog(@"收藏成功！");
        }else{
            // NSLog(@"收藏失败！");
            [SGInfoAlert showInfo:@"收藏失败!" bgColor:nil inView:self.view vertical:100];
        }
    }else{
        
    }
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
