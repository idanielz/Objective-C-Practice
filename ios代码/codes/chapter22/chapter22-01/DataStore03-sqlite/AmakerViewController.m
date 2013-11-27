//
//  AmakerViewController.m
//  DataStore03-sqlite
//
//  Created by Mahmood1 on 10/26/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "AmakerViewController.h"

@implementation AmakerViewController

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    util = [[DbUtil alloc]init];
    
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

// 创建表
- (IBAction)create:(id)sender {
    sqlite3 *db;
    db = [util open];
    [util createTable:db];
    [util close:db];
}
// 插入数据
- (IBAction)insert:(id)sender {
    Person *per = [[Person alloc]init];
    [per setPid:1];
    [per setName:@"tom"];
    [per setPwd:@"123"];
    
    [util insert:per ];
}
// 删除数据
- (IBAction)delete2:(id)sender{
    [util del:1];
}
// 更新数据
- (IBAction)update:(id)sender {
    Person *per = [[Person alloc]init];
    [per setPid:3];
    [per setName:@"tom3"];
    [per setPwd:@"333"];
    [util update:per];
}
// 查询数据
- (IBAction)query:(id)sender {
    [util query];
}
@end
