//
//  AmakerViewController.m
//  chapter22-02
//
//  Created by amaker on 3/8/13.
//  Copyright (c) 2013 amaker. All rights reserved.
//

#import "AmakerViewController.h"
#import "Person.h"
@interface AmakerViewController ()

@end

@implementation AmakerViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // 实例化数据库工具类
	self.util = [[DbUtil alloc]init];
    // 创建表
    [self.util createTable];
    // 查询数据
    self.dataSource = [self.util query];
    // 添加按钮
    self.addItem = [[UIBarButtonItem alloc]initWithTitle:@"Add" style:UIBarButtonItemStylePlain target:self action:@selector(add)];
    self.navigationItem.rightBarButtonItem = self.addItem;
    // 删除按钮
    self.delItem = [[UIBarButtonItem alloc]initWithTitle:@"Del" style:UIBarButtonItemStylePlain target:self action:@selector(del)];
    self.navigationItem.leftBarButtonItem = self.delItem;
}
// 使用对话框添加
-(void)add{
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Add" message:nil delegate:self cancelButtonTitle:@"Add" otherButtonTitles:@"Cancel", nil];
    alert.alertViewStyle = UIAlertViewStyleLoginAndPasswordInput;
    [alert show];
}
// 删除方法，更改表格的编辑状态
-(void)del{
    BOOL result = [self.tableView isEditing];
    if (result) {
        [self.tableView setEditing:NO];
        self.delItem.title=@"Del";
    }else{
        [self.tableView setEditing:YES];
        self.delItem.title = @"Done";
    }
}
// 删除数据
-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    Person *p = [self.dataSource objectAtIndex:[indexPath row]];
    int pid = p.pid;
    [self.util del:pid];
    [self.tableView reloadData];
}
// 添加数据
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    UITextField *nameTf = [alertView textFieldAtIndex:0];
    UITextField *pwdTf = [alertView textFieldAtIndex:1];
    
    NSString *name = nameTf.text;
    NSString *pwd = pwdTf.text;
    
    Person *p = [[Person alloc]init];
    p.name = name;
    p.pwd = pwd;
    
    nameTf.text=@"";
    pwdTf.text=@"";
    
    [self.util insert:p];
    
    [self.tableView reloadData];
}
// 表格行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    self.dataSource = [self.util query];
    return [self.dataSource count];
}
// 表格单元
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cid = @"cid";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cid];
    if (cell==nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cid];
    }
    
    Person *p = [self.dataSource objectAtIndex:[indexPath row]];
    cell.textLabel.text = p.name;
    cell.detailTextLabel.text = p.pwd;
    
    return cell;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
