//
//  ZJDViewController.m
//  TableViewExample
//
//  Created by DanielZ on 13-11-23.
//  Copyright (c) 2013年 DanielZ. All rights reserved.
//

#import "ZJDViewController.h"

@interface ZJDViewController ()

@end

@implementation ZJDViewController

@synthesize books,bookKey;
@synthesize cameraKay,cameras;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    NSString *bookPath = [[NSBundle mainBundle] pathForResource:@"books" ofType:@"plist"];
    books = [[NSDictionary alloc] initWithContentsOfFile:bookPath];
    bookKey = [books allKeys];
    
    NSString *cameraPath = [[NSBundle mainBundle] pathForResource:@"camera" ofType:@"plist"];
    cameras = [[NSDictionary alloc] initWithContentsOfFile:cameraPath];
    cameraKay = [cameras allKeys];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView              // Default is 1 if not
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(section ==0)
        return [books count];
    else
        return [cameras count];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return @"books";
    }
    else
        return @"cameras";
}
// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellId = @"mytext";
    NSString *author;
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    //UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    if (nil == cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellId];
    }
    if ([indexPath section] == 0) {
        [[cell textLabel] setText:[bookKey objectAtIndex:[indexPath row]]];
        author = [books objectForKey:[bookKey objectAtIndex:[indexPath row]]];
    }
    else
    {
        [[cell textLabel] setText:[cameraKay objectAtIndex:[indexPath row]]];
        author = [books objectForKey:[bookKey objectAtIndex:[indexPath row]]];
    }
    
    [[cell detailTextLabel] setText:author];
    cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
    NSString *imgPath = [[NSBundle mainBundle] pathForResource:@"yoyo2" ofType:@"jpg"];
    UIImage *img = [[UIImage alloc] initWithContentsOfFile:imgPath];
    [[cell imageView]setImage:img];
    return cell;
}

@end
