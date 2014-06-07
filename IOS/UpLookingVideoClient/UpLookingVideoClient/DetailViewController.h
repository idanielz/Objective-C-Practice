//
//  DetailViewController.h
//  todoListDemo
//
//  Created by DanielZ on 14-2-21.
//  Copyright (c) 2014年 DanielZ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyCollectionViewCell.h"
@interface DetailViewController : UIViewController<UICollectionViewDataSource,UICollectionViewDelegate>

@property (nonatomic, strong) NSArray *dataSource;
@property (nonatomic, strong) UIBarButtonItem *rightItem;
@property (strong, nonatomic) IBOutlet UICollectionView *myCollectionView;
@property (nonatomic,strong) MyCollectionViewCell *myCollectionViewCell;
//- (void)reloadMyTableView;
- (void)getVideoDetailById:(NSNumber *)vid;
- (void)reloadMyCollectionView;
@end
