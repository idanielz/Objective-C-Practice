//
//  AmakerRootViewController.h
//  chapter23-03
//
//  Created by amaker on 3/7/13.
//  Copyright (c) 2013 amaker. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CoreDataUtil.h"
// 实现UITableViewDataSource、UITableViewDelegate和UIAlertViewDelegate协议
@interface AmakerRootViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,UIAlertViewDelegate>
// CoreData工具类
@property(nonatomic,strong)CoreDataUtil *util;
// 数据源
@property(nonatomic,strong)NSMutableArray *dataSource;
// 表格视图
@property (strong, nonatomic) IBOutlet UITableView *tableView;
// 添加删除按钮
@property(nonatomic,strong)UIBarButtonItem *addItem,*delItem;
@end
