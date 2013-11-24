//
//  ZJDViewController.h
//  TableViewExample
//
//  Created by DanielZ on 13-11-23.
//  Copyright (c) 2013年 DanielZ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZJDViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property(strong,nonatomic)NSDictionary *books;
@property(strong,nonatomic)NSArray *bookKey;
@property(strong,nonatomic)NSDictionary *cameras;
@property(strong,nonatomic)NSArray *cameraKay;
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
@end
