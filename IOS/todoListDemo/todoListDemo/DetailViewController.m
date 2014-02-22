//
//  DetailViewController.m
//  todoListDemo
//
//  Created by DanielZ on 14-2-21.
//  Copyright (c) 2014年 DanielZ. All rights reserved.
//

#import "DetailViewController.h"
#import "List.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

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
    self.rightItem = [[UIBarButtonItem alloc]initWithTitle:@"添加" style:UIBarButtonItemStyleBordered target:self action:@selector(addList)];
    UIBarButtonItem *flex = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    self.myToolBar.items = @[flex,self.rightItem];
    self.dao = [[ListDao alloc]init];
    NSArray *array = [self.dao queryWithCategory:self.currentCategory];
    self.dataSource = [NSMutableArray arrayWithArray:array];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSArray *array = [self.dao queryWithCategory:self.currentCategory];
    self.dataSource = [NSMutableArray arrayWithArray:array];
    return [self.dataSource count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cid = @"cid";
    UITableViewCell *cell = [tableView dequeueReusableHeaderFooterViewWithIdentifier:cid];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cid];
    }
    List *list = [self.dataSource objectAtIndex:[indexPath row]];
    cell.textLabel.text = [list content];
    cell.detailTextLabel.text = [[list fireDate]description];
    return cell;
}

- (void)reloadMyTableView{
    NSArray *array = [self.dao queryWithCategory:self.currentCategory];
    self.dataSource = [NSMutableArray arrayWithArray:array];
    [self.myTableView reloadData];
}
- (void)addList{
    NSString *content = self.myTextField.text;
    NSDate *fireDate = self.myDatePicker.date;
    NSLog(@"date = %@", [fireDate description]);
    [self.dao add:content andFireDate:fireDate andCategory:self.currentCategory];
    [self.myTableView reloadData];
}
@end
