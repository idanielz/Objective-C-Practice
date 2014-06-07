//
//  DetailViewController.m
//  todoListDemo
//
//  Created by DanielZ on 14-2-21.
//  Copyright (c) 2014年 DanielZ. All rights reserved.
//

#import "DetailViewController.h"
#import "Model.h"
#import "ASIFormDataRequest.h"
#import "MyCollectionViewCell.h"
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
    UINib *nib = [UINib nibWithNibName:@"MyCollectionViewCell" bundle:nil];
    [self.myCollectionView registerNib:nib forCellWithReuseIdentifier:@"cid"];
    self.dataSource = [[NSArray alloc]init];
    //[self.dataSource addObject:@"A"];
    //[self.myCollectionView reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    NSLog(@"count= %d", [self.dataSource count]);
    return [self.dataSource count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSBundle *bundle = [NSBundle mainBundle];
    NSArray *array = [bundle loadNibNamed:@"MyCollectionViewCell" owner:self options:nil];
    
    MyCollectionViewCell *cell = [array objectAtIndex:0];

    NSDictionary *dic = [self.dataSource objectAtIndex:[indexPath row]];
    NSLog(@"dic : %@", dic);
    NSString *title = [dic objectForKey:@"title"];
    NSString *source = [dic objectForKey:@"source"];
    NSString *flashimg = [dic objectForKey:@"flashimg"];
    cell.myLabel.text = title;

    __weak ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:[NSURL URLWithString:source]];
    [request setCompletionBlock:^{
        NSData *data = [request responseData];
        cell.myImage.image = [UIImage imageWithData:data];
    }];
    [request startAsynchronous];
    return cell;
}

- (void)reloadMyCollectionView{
        [self.myCollectionView reloadData];
}
- (void)getVideoDetailById:(NSNumber *)vid
{
    NSLog(@"getVideoDetailById....");
    Model *m = [[Model alloc]init];
    __weak ASIFormDataRequest *request = [m buildVideoDetailRequest:[vid intValue]];
    [request setCompletionBlock:^{
        NSData *data = [request responseData];
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
        NSArray *array = [dic objectForKey:@"videolist"];
        NSLog(@"array: %d", [array count]);
        self.dataSource = array;//[NSMutableArray arrayWithArray:array];
        //[self.myCollectionView reloadData];
        NSLog(@"dataSource: %d",[self.dataSource count]);
        [self.myCollectionView reloadData];

        //[self.myCollectionView performSelectorOnMainThread:@selector(reloadData) withObject:nil waitUntilDone:NO];
    }];
    [request startAsynchronous];
    [self.myCollectionView reloadData];
}


@end
