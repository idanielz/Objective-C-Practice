//
//  Tab2ViewController.h
//  UpLookingVideoClient
//
//  Created by DanielZ on 14-2-22.
//  Copyright (c) 2014年 DanielZ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Tab2ViewController : UICollectionViewController<UICollectionViewDataSource,UICollectionViewDelegate>

@property (strong, nonatomic) IBOutlet UICollectionView *myCollectionView;
@property (nonatomic, strong) NSMutableArray * dataSource;
@end
