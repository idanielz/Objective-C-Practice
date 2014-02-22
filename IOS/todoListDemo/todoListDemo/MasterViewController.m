//
//  MasterViewController.m
//  todoListDemo
//
//  Created by DanielZ on 14-2-21.
//  Copyright (c) 2014年 DanielZ. All rights reserved.
//

#import "MasterViewController.h"
#import "ListCategory.h"
#import "DetailViewController.h"
@interface MasterViewController ()

@end

@implementation MasterViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.rightItem = [[UIBarButtonItem alloc]initWithTitle:@"删除类型" style:UIBarButtonItemStylePlain target:self action: @selector(delCategory)];
    self.navigationItem.rightBarButtonItem = self.rightItem;
    
    //可伸缩空间
    UIBarButtonItem * flexBar = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    
    UIBarButtonItem * addCatogaryButton = [[UIBarButtonItem alloc]initWithTitle:@"添加" style:UIBarButtonItemStyleBordered target: self  action:@selector(addCategory)];
    self.myToolBar.items = @[flexBar,addCatogaryButton];
    
    self.dao = [[ListCategoryDao alloc]init];
    NSArray *array = [self.dao query];
    self.dataSource= [NSMutableArray arrayWithArray:array];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSArray *array = [self.dao query];
    self.dataSource= [NSMutableArray arrayWithArray:array];

    return [self.dataSource count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cid = @"cid";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cid];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cid];
    }
    ListCategory *lc= [[self dataSource] objectAtIndex:[indexPath row]];
    cell.textLabel.text = lc.name;
    return cell;
}

- (void)addCategory{
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"添加类型" message:@"请输入类型名称" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles: @"OK", nil];
    alert.alertViewStyle = UIAlertViewStylePlainTextInput;
    [alert show];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (1 == buttonIndex)
    {
        UITextField *nameTf = [alertView textFieldAtIndex:0];
        NSString *name = nameTf.text;
        [self.dao add:name];
        [self.myTableView reloadData];
    }
}

- (void)delCategory{
    if (self.myTableView.isEditing) {
        [self.myTableView setEditing:false];
        self.rightItem.title =@"删除";
    }else{
        [self.myTableView setEditing:true];
        self.rightItem.title =@"完成";
    }
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    ListCategory *lc = [self.dataSource objectAtIndex:[indexPath row]];
    [self.dataSource removeObject:lc];
    [self.dao del:lc];
    [self.myTableView reloadData];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    ListCategory *lc = [self.dataSource objectAtIndex:[indexPath row]];
    self.detailViewController.currentCategory = lc;
    [self.detailViewController performSelector:@selector(reloadMyTableView)];
}

@end
