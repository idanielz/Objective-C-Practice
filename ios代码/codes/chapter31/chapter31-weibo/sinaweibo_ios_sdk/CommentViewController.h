//
//  CommentViewController.h
//  chapter31-weibo
//
//  Created by amaker on 5/10/13.
//  Copyright (c) 2013 amaker. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SinaWeibo.h"
#import "SinaWeiboRequest.h"

@interface CommentViewController : UIViewController<SinaWeiboRequestDelegate>
// 评论内容输入框
@property (strong, nonatomic) IBOutlet UITextView *commentTextView;
// 当前微博id
@property(strong,nonatomic) NSString *sid;
@end
