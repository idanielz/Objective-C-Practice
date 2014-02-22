//
//  MasterViewController.h
//  todoListDemo
//
//  Created by DanielZ on 14-2-21.
//  Copyright (c) 2014年 DanielZ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ListCategoryDao.h"
#import "DetailViewController.h"
@interface MasterViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,UIAlertViewDelegate>

@property (nonatomic, strong) UIBarButtonItem * rightItem;

@property (strong, nonatomic) IBOutlet UIToolbar *myToolBar;
@property (nonatomic, strong) NSMutableArray *dataSource;
@property (nonatomic, strong) ListCategoryDao *dao;
@property (strong, nonatomic) IBOutlet UITableView *myTableView;
@property (nonatomic, strong) DetailViewController *detailViewController;
@end
