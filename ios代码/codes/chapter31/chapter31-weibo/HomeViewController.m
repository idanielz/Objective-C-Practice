//
//  HomeViewController.m
//  chapter31-weibo
//
//  Created by amaker on 5/8/13.
//  Copyright (c) 2013 amaker. All rights reserved.
//

#import "HomeViewController.h"
#import "ImageUtil.h"
#import "AmakerAppDelegate.h"
#import "JSONKit.h"
#import "ASIHTTPRequest.h"
#import "ASIDownloadCache.h"
#import "PostWeiboViewController.h"


#define CELL_CONTENT_WIDTH 320
#define CELL_CONTENT_MARGIN 10

#import <QuartzCore/QuartzCore.h>

@interface HomeViewController ()

@end

@implementation HomeViewController


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.tabBarItem.title = @"首页";
        UIImage *originalImage = [UIImage imageNamed:@"home.png"];
        self.tabBarItem.image = [ImageUtil scaleImage:originalImage andScale:2.0];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // 加载微博信息
    [self loadWeibo];
    // 表视图的frame
    CGRect tvFrame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    // 实例化表视图
    self.tv = [[UITableView alloc]initWithFrame:tvFrame];
    // 设置代理
    self.tv.dataSource = self;
    self.tv.delegate = self;
    // 将表视图添加到当前视图
    [self.view addSubview:self.tv];
    // 实例化表视图数据源
    self.tvDataSource = [NSMutableArray arrayWithCapacity:5];
    
    // 设置写微博导航按钮
    UIBarButtonItem *writeWeiboBtnItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemCompose target:self action:@selector(writeWeibo)];
    self.navigationItem.leftBarButtonItem = writeWeiboBtnItem;
    // 刷新微博导航按钮
    UIBarButtonItem *refreshBtnItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh target:self action:@selector(refresh)];
    self.navigationItem.rightBarButtonItem = refreshBtnItem;
}
// 刷新微博
-(void)refresh{
    [self loadWeibo];
}

// 写微博
-(void)writeWeibo{
    PostWeiboViewController *postWeibo = [[PostWeiboViewController alloc]initWithNibName:@"PostWeiboViewController" bundle:nil];
    [self.navigationController pushViewController:postWeibo animated:YES];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.tvDataSource count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    // 标示id
    static NSString *cid = @"cid";
    // 实例化UITableViewCell
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cid];
    if (cell==nil) {
        cell = [[UITableViewCell alloc]initWithFrame:CGRectZero];
    }
    
    // 获得当前行内容
    NSDictionary *dic = [self.tvDataSource objectAtIndex:indexPath.row];
    // 用户信息
    NSDictionary *userDic = [dic objectForKey:@"user"];
    // 1. 头像
    NSString *profile_image_url = [userDic objectForKey:@"profile_image_url"];
    NSURL *photoURL = [NSURL URLWithString:profile_image_url];
    __weak ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:photoURL];
    // 异步加载头像信息
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
        [cell.contentView addSubview:self.profileImageView];
        
        [cell setNeedsLayout];
    }];
    [request startAsynchronous];
    
    // 2. 用户名称
    NSString *username = [userDic objectForKey:@"name"];
    self.usernameLabel = [[UILabel alloc]initWithFrame:CGRectZero];
    CGRect usernameFrame = CGRectMake(60, 5, 100, 21);
    self.usernameLabel.frame = usernameFrame;
    self.usernameLabel.text = username;
    self.usernameLabel.font = [UIFont systemFontOfSize:12];
    [cell.contentView addSubview:self.usernameLabel];
    
    // 3. 转发数
    NSString *reposts_count = [dic objectForKey:@"reposts_count"];
    self.repostCountLabel = [[UILabel alloc]initWithFrame:CGRectZero];
    CGRect repostCountFrame = CGRectMake(160, 5, 60, 21);
    self.repostCountLabel.frame = repostCountFrame;
    self.repostCountLabel.text = [NSString stringWithFormat:@"转发数：%@",reposts_count];
    self.repostCountLabel.font = [UIFont systemFontOfSize:10];
    [cell.contentView addSubview:self.repostCountLabel];
    // 4. 评论数
    NSString *comments_count = [dic objectForKey:@"comments_count"];
    self.commentCountLabel = [[UILabel alloc]initWithFrame:CGRectZero];
    CGRect commentsCountFrame = CGRectMake(220, 5, 60, 21);
    self.commentCountLabel.frame = commentsCountFrame;
    self.commentCountLabel.text = [NSString stringWithFormat:@"评论数：%@",comments_count];
    self.commentCountLabel.font = [UIFont systemFontOfSize:10];
    [cell.contentView addSubview:self.commentCountLabel];
    
    // 5. 微博信息
    NSString *text = [dic objectForKey:@"text"];
    CGSize constraint = CGSizeMake(CELL_CONTENT_WIDTH - (CELL_CONTENT_MARGIN * 2), 20000.0f);
    CGSize size = [text sizeWithFont:[UIFont systemFontOfSize:12] constrainedToSize:constraint lineBreakMode:NSLineBreakByWordWrapping];
    self.myTextLabel = [[UILabel alloc]initWithFrame:CGRectZero];
    self.myTextLabel.frame = CGRectMake(60, 26, size.width-20, size.height);
    self.myTextLabel.numberOfLines = 0;
    self.myTextLabel.lineBreakMode = NSLineBreakByWordWrapping;
    self.myTextLabel.font = [UIFont systemFontOfSize:12];
    self.myTextLabel.text = text;
    [cell.contentView addSubview:self.myTextLabel];
    
    
    // 6. 图片
    NSString *thumbnail_pic = [dic objectForKey:@"thumbnail_pic"];
    if (thumbnail_pic!=nil&&[thumbnail_pic length]>0) {
        NSURL *thumbnail_picURL = [NSURL URLWithString:thumbnail_pic];
        request = [ASIHTTPRequest requestWithURL:thumbnail_picURL];
        __block UIImage *tempImage;
        [request setDownloadCache:[ASIDownloadCache sharedCache]];
        [request setCompletionBlock:^{
            NSData *responseData = [request responseData];
            tempImage = [UIImage imageWithData:responseData];
            self.picImageView = [[UIImageView alloc]initWithImage:tempImage];
            self.picImageView.frame = CGRectMake(60, size.height+30, tempImage.size.width, tempImage.size.height);
            
            [cell.contentView addSubview:self.picImageView];
            
            
            // 7. 创建时间
            NSString *created_at = [dic objectForKey:@"created_at"];
            
            self.createAtLabel = [[UILabel alloc]initWithFrame:CGRectZero];
            self.createAtLabel.frame = CGRectMake(5, size.height+self.picImageView.frame.size.height+50, 200, 21);
            self.createAtLabel.text = [NSString stringWithFormat:@"创建时间：%@",created_at];
            self.createAtLabel.font = [UIFont systemFontOfSize:10];
            [cell.contentView addSubview:self.createAtLabel];
            self.cellHeight = size.height+self.picImageView.frame.size.height+60;
            [cell setNeedsLayout];
        }];
        [request startAsynchronous];
    }else{
        // 7. 创建时间
        NSString *created_at = [dic objectForKey:@"created_at"];
        
        self.createAtLabel = [[UILabel alloc]initWithFrame:CGRectZero];
        self.createAtLabel.frame = CGRectMake(5, size.height+50, 200, 21);
        self.createAtLabel.text = [NSString stringWithFormat:@"创建时间：%@",created_at];
        self.createAtLabel.font = [UIFont systemFontOfSize:10];
        [cell.contentView addSubview:self.createAtLabel];
        self.cellHeight = size.height+self.picImageView.frame.size.height+60;
        [cell setNeedsLayout];
    }
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 300;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    WeiboDetailViewController *weiboDetail = [[WeiboDetailViewController alloc]initWithNibName:@"WeiboDetailViewController" bundle:nil];
    // 获得当前行内容
    NSDictionary *dic = [self.tvDataSource objectAtIndex:indexPath.row];
    weiboDetail.weiboContentDic = dic;
    //[self presentViewController:weiboDetail animated:YES completion:nil];
    [self.navigationController pushViewController:weiboDetail animated:YES];
}

-(SinaWeibo*)getSinaWeibo{
    AmakerAppDelegate *delegate = (AmakerAppDelegate*)[UIApplication sharedApplication].delegate;
    return delegate.sinaweibo;
}
// 加载微博信息
- (void)loadWeibo {
    // 获得SinaWeibo实例
    SinaWeibo *sinaweibo = [self getSinaWeibo];
    // 发出请求
    [sinaweibo requestWithURL:@"statuses/home_timeline.json"
                       params:[NSMutableDictionary dictionaryWithObject:sinaweibo.accessToken forKey:@"access_token"]
                   httpMethod:@"GET"
                     delegate:self];
}

- (void)request:(SinaWeiboRequest *)request didFinishLoadingWithResult:(id)result{
   // 转换为NSDictionary
    NSDictionary *dic = (NSDictionary*)result;
    // 获得key为statuses的内容
    NSArray *statuses = [dic objectForKey:@"statuses"];
    NSLog(@"statused=%@",statuses);
    // 清除数据源
    [self.tvDataSource removeAllObjects];
    // 设置数据源
    [self.tvDataSource addObjectsFromArray:statuses];
    // 重新加载表视图
    [self.tv reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
