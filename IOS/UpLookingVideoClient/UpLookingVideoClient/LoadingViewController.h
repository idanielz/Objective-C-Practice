//
//  LoadingViewController.h
//  UpLookingVideoClient
//
//  Created by DanielZ on 14-2-22.
//  Copyright (c) 2014年 DanielZ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Tab1ViewController.h"
@interface LoadingViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *myIndicator;
@property (strong, nonatomic) UITabBarController *tab;

- (void)forwardMain;
@end
