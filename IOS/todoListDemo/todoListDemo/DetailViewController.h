//
//  DetailViewController.h
//  todoListDemo
//
//  Created by DanielZ on 14-2-21.
//  Copyright (c) 2014年 DanielZ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ListDao.h"
#import "ListCategory.h"
@interface DetailViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate>

@property (strong, nonatomic) IBOutlet UITableView *myTableView;
@property (strong, nonatomic) IBOutlet UIDatePicker *myDatePicker;
@property (strong, nonatomic) IBOutlet UITextField *myTextField;
@property (nonatomic, strong) NSMutableArray *dataSource;
@property (nonatomic, strong) UIBarButtonItem *rightItem;
@property (strong, nonatomic) IBOutlet UIToolbar *myToolBar;
@property (nonatomic, strong) ListDao *dao;

@property (nonatomic, strong) ListCategory * currentCategory;
- (void)reloadMyTableView;
@end
