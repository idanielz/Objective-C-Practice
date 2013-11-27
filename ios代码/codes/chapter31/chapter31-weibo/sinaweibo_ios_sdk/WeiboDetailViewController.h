//
//  WeiboDetailViewController.h
//  chapter31-weibo
//
//  Created by amaker on 5/10/13.
//  Copyright (c) 2013 amaker. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SinaWeiboRequest.h"

@interface WeiboDetailViewController : UIViewController<SinaWeiboRequestDelegate,UITableViewDataSource,UITableViewDelegate,UIActionSheetDelegate>
// 头像
@property(nonatomic,strong) IBOutlet UIImageView *profileImageView;
// 图片
@property(nonatomic,strong)IBOutlet UIImageView *picImageView;
// 用户名称、博客内容
@property(nonatomic,strong)IBOutlet UILabel *usernameLabel,*myTextLabel;

// 评论表和转发表的容器视图
@property(nonatomic,strong)UIView *containerView;
// 评论表
@property(nonatomic,strong) UITableView *commentTv;
// 转发表
@property(nonatomic,strong) UITableView *repostTv;
// 当前表
@property(nonatomic,strong) UITableView *currentTv;
// 评论数据源
@property(nonatomic,strong) NSMutableArray *commentDataSource;
// 转发数据源
@property(nonatomic,strong) NSMutableArray *repostDataSource;
// 当前微博内容
@property(nonatomic,strong)NSDictionary *weiboContentDic;
// 当前微博id
@property(nonatomic,strong)NSString *sid;

@end
