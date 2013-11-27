//
//  RepostViewController.h
//  chapter31-weibo
//
//  Created by amaker on 5/10/13.
//  Copyright (c) 2013 amaker. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SinaWeibo.h"
#import "SinaWeiboRequest.h"
// 实现请求代理
@interface RepostViewController : UIViewController<SinaWeiboRequestDelegate>
// 转发内容文本视图
@property (strong, nonatomic) IBOutlet UITextView *repostTextView;
// 微博id
@property(strong,nonatomic) NSString *sid;
@end
