//
//  AmakerViewController.h
//  chapter22-02
//
//  Created by amaker on 3/8/13.
//  Copyright (c) 2013 amaker. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DbUtil.h"
// 实现表视图数据源协议和代理协议，以及警告视图代理协议
@interface AmakerViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,UIAlertViewDelegate>
// 表格视图属性
@property (strong, nonatomic) IBOutlet UITableView *tableView;
// 数据源属性
@property(nonatomic,strong)NSMutableArray *dataSource;
// 数据库工具类属性
@property(nonatomic,strong)DbUtil *util;
// 导航按钮属性
@property(nonatomic,strong)UIBarButtonItem *addItem,*delItem;
@end
