//
//  AmakerAppDelegate.h
//  chapter31-weibo
//
//  Created by amaker on 5/7/13.
//  Copyright (c) 2013 amaker. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SinaWeibo.h"




#define kAppKey             @"2879630549"
#define kAppSecret          @"76b5cd21a6e755840ce92e33f09c44d5"
#define kAppRedirectURI     @"http://www.any-phone.com"

@class RootViewController;

@interface AmakerAppDelegate : UIResponder <UIApplicationDelegate,SinaWeiboDelegate, SinaWeiboRequestDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) RootViewController *viewController;
@property (strong, nonatomic) SinaWeibo *sinaweibo;


@end
