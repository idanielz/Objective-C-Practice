//
//  PostWeiboViewController.h
//  chapter31-weibo
//
//  Created by amaker on 5/9/13.
//  Copyright (c) 2013 amaker. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SinaWeiboRequest.h"
@interface PostWeiboViewController : UIViewController<SinaWeiboRequestDelegate>
// 微博内容
@property (strong, nonatomic) IBOutlet UITextView *postTextView;
@end
