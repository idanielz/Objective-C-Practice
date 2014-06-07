//
//  Tab1ViewController.h
//  UpLookingVideoClient
//
//  Created by DanielZ on 14-2-22.
//  Copyright (c) 2014年 DanielZ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MasterViewController.h"
#import "DetailViewController.h"
@interface Tab1ViewController : UIViewController
@property (nonatomic, strong) UIPopoverController *pop;
@property (nonatomic, strong) UISplitViewController *splitViewController;
@property (nonatomic, strong) MasterViewController *masterViewController;
@property (nonatomic, strong) DetailViewController *detailViewController;
@property (nonatomic, strong) UINavigationController *masterNavi;
@end
