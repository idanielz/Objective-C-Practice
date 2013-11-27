//
//  AmakerRootViewController.m
//  chapter23-03
//
//  Created by amaker on 3/7/13.
//  Copyright (c) 2013 amaker. All rights reserved.
//

#import "AmakerRootViewController.h"

@interface AmakerRootViewController ()
@property(nonatomic,strong)Customer *currentCustomer;
@end

@implementation AmakerRootViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // 实例化CoreDataUtil
    self.util = [[CoreDataUtil alloc]init];
    // 查询客户列表
    NSArray *array = [self.util queryCustoer];
    // 初始化数据源
    self.dataSource = [NSMutableArray arrayWithArray:array];
    // 实例化添加、删除按钮
    self.addItem = [[UIBarButtonItem alloc]initWithTitle:@"Add" style:UIBarButtonItemStylePlain target:self action:@selector(add)];
    self.navigationItem.rightBarButtonItem = self.addItem;
    
    self.delItem = [[UIBarButtonItem alloc]initWithTitle:@"Del" style:UIBarButtonItemStylePlain target:self action:@selector(del)];
    self.navigationItem.leftBarButtonItem = self.delItem;
}

// 添加方法
-(void)add{
    // 显示对话框
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Add Customer" message:nil delegate:self cancelButtonTitle:@"Add" otherButtonTitles:nil, nil];
    alert.alertViewStyle = UIAlertViewStylePlainTextInput;
    [alert show];
}
// 删除方法，设置编辑属性
-(void)del{
    if (![self.tableView isEditing]) {
        self.delItem.title=@"Done";
        [self.tableView setEditing:YES];
    }else{
        self.delItem.title=@"Del";
        [self.tableView setEditing:NO];
    }
}

// 删除数据
-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    // 获得当前数据
    Customer *c = [self.dataSource objectAtIndex:[indexPath row]];
    // 从数据源数组删除
    [self.dataSource removeObject:c];
    // 从数据库删除
    [self.util deleteCustomer:c];
    // 重新加载表视图
    [self.tableView reloadData];
}
// 对话框代理方法，实现添加数据
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    // 获得按钮标题
    NSString *title = [alertView buttonTitleAtIndex:0];
    // 获得输入框
    UITextField *nameTf = [alertView textFieldAtIndex:0];
    // 获得输入框内容
    NSString *name = nameTf.text;
    // 添加
    if ([title isEqualToString:@"Add"]) {
        [self.util addCustomer:name];
    }else{
        // 更新
        self.currentCustomer.name = name;
        [self.util updateCustomer:self.currentCustomer];
    }
    // 重新加载表视图
    [self.tableView reloadData];
}

// 根据客户列表数，返回表格行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSArray *array = [self.util queryCustoer];
    self.dataSource = [NSMutableArray arrayWithArray:array];
    return [self.dataSource count];
}
// 获得表格单元
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cid"];
    if (cell==nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cid"];
    }
    Customer *c = [self.dataSource objectAtIndex:[indexPath row]];
    cell.textLabel.text = c.name;
    return cell;
}
// 选中行，修改客户信息
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    // 弹出对话框，显示要更新的数据
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Update Customer" message:nil delegate:self cancelButtonTitle:@"Update" otherButtonTitles:nil, nil];
    alert.alertViewStyle = UIAlertViewStylePlainTextInput;
    
    UITextField *nameTf = [alert textFieldAtIndex:0];
    Customer *c = [self.dataSource objectAtIndex:[indexPath row]];
    self.currentCustomer = c;
    nameTf.text = c.name;
    [alert show];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
