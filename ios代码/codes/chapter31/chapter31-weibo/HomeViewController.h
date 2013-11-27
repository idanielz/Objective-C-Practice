//
//  HomeViewController.h
//  chapter31-weibo
//
//  Created by amaker on 5/8/13.
//  Copyright (c) 2013 amaker. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SinaWeibo.h"
#import "WeiboDetailViewController.h"

@interface HomeViewController : UIViewController<SinaWeiboRequestDelegate,UITableViewDataSource,UITableViewDelegate>
// 表视图属性
@property(nonatomic,strong)UITableView *tv;
// 表视图数据源
@property(nonatomic,strong)NSMutableArray *tvDataSource;
// 头像
@property(nonatomic,strong) IBOutlet UIImageView *profileImageView;
// 图片
@property(nonatomic,strong)IBOutlet UIImageView *picImageView;
// 用户名称、博客内容、转发数量、评论数量、创建时间、来源、推荐数量
@property(nonatomic,strong)IBOutlet UILabel *usernameLabel,*myTextLabel,*repostCountLabel,*commentCountLabel,*createAtLabel,*sourceLabel,*attitudeCountLabel;
// 行高
@property(nonatomic)float cellHeight;
@end
