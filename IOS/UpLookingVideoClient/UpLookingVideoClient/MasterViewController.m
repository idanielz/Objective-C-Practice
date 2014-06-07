//
//  MasterViewController.m
//  todoListDemo
//
//  Created by DanielZ on 14-2-21.
//  Copyright (c) 2014年 DanielZ. All rights reserved.
//

#import "MasterViewController.h"
#import "DetailViewController.h"
#import "PopContentViewController.h"
#import "Model.h"
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
    self.rightItem = [[UIBarButtonItem alloc]initWithTitle:@"类型" style:UIBarButtonItemStylePlain target:self action: @selector(show)];
    self.leftItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(add)];
    self.navigationItem.leftBarButtonItem = self.leftItem;
    self.navigationItem.rightBarButtonItem = self.rightItem;
    
    //可伸缩空间
    UIBarButtonItem * flexBar = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    
    UIBarButtonItem * addCatogaryButton = [[UIBarButtonItem alloc]initWithTitle:@"添加" style:UIBarButtonItemStyleBordered target: self  action:@selector(addCategory)];
    PopContentViewController * content = [[PopContentViewController alloc]initWithNibName:@"PopContentViewController" bundle:nil];
    self.pop = [[UIPopoverController alloc]initWithContentViewController:content];
    self.myToolBar.items = @[flexBar,addCatogaryButton];
    self.dataSource = [[NSMutableArray alloc]init ];//]WithCapacity:10000];
    Model *model = [[Model alloc]init];
    NSString *videoData = [model getAllVideo];
    NSLog(@"videoData = %@", videoData);
    NSArray *json = [NSJSONSerialization JSONObjectWithData:[videoData dataUsingEncoding:NSUTF8StringEncoding] options:NSJSONReadingAllowFragments error:nil];
    NSLog(@"json count = %u", [json count]);
    self.dataSource = [NSMutableArray arrayWithArray:json];
    self.detailViewController = [[DetailViewController alloc]init];

    //[self.myTableView reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return [self.dataSource count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cid = @"cid";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cid];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cid];
    }
    NSDictionary * dic =  [self.dataSource objectAtIndex:[indexPath row]];
    
    
    __weak ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:[NSURL URLWithString:[dic objectForKey:@"pic"]]];
    [request setCompletionBlock:^{
        cell.textLabel.text = [dic objectForKey:@"title"];
        cell.detailTextLabel.text = [dic objectForKey:@"info"];
        NSData *picData = [request responseData];
        cell.imageView.image = [UIImage imageWithData:picData];
        [cell setNeedsLayout];
    }];
    [request startAsynchronous];
    return cell;
}

- (void)addCategory{
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"添加类型" message:@"请输入类型名称" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles: @"OK", nil];
    alert.alertViewStyle = UIAlertViewStylePlainTextInput;
    [alert show];
}
//
//- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
//    if (1 == buttonIndex)
//    {
//        [self.myTableView reloadData];
//    }
//}

- (void)show
{

    [self.pop presentPopoverFromBarButtonItem:self.rightItem permittedArrowDirections:UIPopoverArrowDirectionUp animated:YES];
}

- (void)add
{
//    NSDate *date = [NSDate date];
//    NSTimeZone *zone = [NSTimeZone systemTimeZone];
//    NSInteger interval = [zone secondsFromGMTForDate: date];
//    NSDate *localeDate = [date  dateByAddingTimeInterval: interval];
//    NSString *strDate = [localeDate description];
//    NSLog(@"%@", strDate);
//    [self.dataSource addObject:strDate];
//    [self.myTableView reloadData];
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{

    [self.myTableView reloadData];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSDictionary *dic = [self.dataSource objectAtIndex:[indexPath row]];
    int vid = [[dic objectForKey:@"id"]intValue];
    NSLog(@"selected %d", vid);
    [self.detailViewController performSelector:@selector(getVideoDetailById:) withObject:[NSNumber numberWithInt:vid]];
    [self.detailViewController performSelector:@selector(reloadMyCollectionView)];
}

@end
