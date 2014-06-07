//
//  Tab2ViewController.m
//  UpLookingVideoClient
//
//  Created by DanielZ on 14-2-22.
//  Copyright (c) 2014年 DanielZ. All rights reserved.
//

#import "Tab2ViewController.h"
#import "MyCollectionViewCell.h"
@interface Tab2ViewController ()

@end

@implementation Tab2ViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.tabBarItem.title = @"TAB2";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.dataSource = [NSMutableArray arrayWithCapacity:5];
    [self.dataSource addObject:@"A"];
    [self.dataSource addObject:@"B"];
    [self.dataSource addObject:@"C"];
    UINib *nib = [UINib nibWithNibName:@"MyCollectionViewCell" bundle:nil];
    [self.myCollectionView registerNib:nib forCellWithReuseIdentifier:@"cid"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.dataSource.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cid = @"cid";
    MyCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:cid forIndexPath:indexPath];
    if (cell == nil) {
        NSBundle *bundle = [NSBundle mainBundle];
        NSArray *views = [bundle loadNibNamed:@"MyCollectionViewCell" owner:self options:nil];
        cell = [views objectAtIndex:0];
    }
    
    cell.myLabel.text = [self.dataSource objectAtIndex:[indexPath row]];
    return cell;
}

@end
