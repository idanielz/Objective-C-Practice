//
//  ScrollViewController.m
//  ScrollImages
//
//  Created by DanielZ on 14-1-2.
//  Copyright (c) 2014年 DanielZ. All rights reserved.
//

#import "ScrollViewController.h"

@interface ScrollViewController ()

@end

@implementation ScrollViewController
@synthesize scrollView, pageControl, imageArray;
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
    //self.scrollView.frame = CGRectMake(0, 0, 320, 640);

    NSString *firstImageUrl = @"http://image.sjrjy.com/201108/0414324554ed90c78f4663.jpg";
    NSData *firstImageData = [[NSData alloc]initWithContentsOfURL:[NSURL URLWithString:firstImageUrl]];
    UIImage *firstImage = [[UIImage alloc]initWithData:firstImageData];
    UIImageView *firstImageView = [[UIImageView alloc]initWithImage:firstImage];
    firstImageView.frame = CGRectMake(0, 0, 320, scrollView.frame.size.height);

    NSString *secondImageUrl = @"http://image.sjrjy.com/201108/04143132ee3ada5a130861.jpg";
    NSData *secondImageData = [[NSData alloc]initWithContentsOfURL:[NSURL URLWithString:secondImageUrl]];
    UIImage *secondImage = [[UIImage alloc]initWithData:secondImageData];
    UIImageView *secondImageView = [[UIImageView alloc]initWithImage:secondImage];
    secondImageView.frame = CGRectMake(0, 0, 320, scrollView.frame.size.height);
    NSString *thirdImageUrl = @"http://image.sjrjy.com/201108/0414305979340cfc8a1537.jpg";
    NSData *thirdImageData = [[NSData alloc]initWithContentsOfURL:[NSURL URLWithString: thirdImageUrl]];
    UIImage *thirdImage = [[UIImage alloc]initWithData:thirdImageData];
    UIImageView *thirdImageView = [[UIImageView alloc]initWithImage:thirdImage];
    thirdImageView.frame = CGRectMake(0, 0, 320, scrollView.frame.size.height);
    imageArray = [NSMutableArray arrayWithObjects:firstImageView, secondImageView, thirdImageView, nil];
    self.view.backgroundColor = [UIColor blackColor];
    for (int i=0; i<imageArray.count; i++) {
        CGRect frame;
        frame.origin.x = self.scrollView.frame.size.width *i;
        frame.origin.y = 0;
        frame.size = self.scrollView.frame.size;
        UIView *subView = [imageArray objectAtIndex:i];
        subView.frame = frame;
        
        [self.scrollView addSubview:subView];
        
    }
    // 设置scroll view的contentSize属性，这个是包含所有页面的scroll view的尺寸
    self.scrollView.contentSize = CGSizeMake(self.scrollView.frame.size.width*imageArray.count, self.scrollView.frame.size.height);
    
    // 告诉分页控件-总共有多少页
    self.pageControl.numberOfPages = imageArray.count;

    //NSMutableArray *imageArray = [[NSMutableArray alloc]init];
    //[imageArray addObject:[UIImage imageNamed:@"http://image.sjrjy.com/201108/0414324554ed90c78f4663.jpg"]];
    //[imageArray addObject:[UIImage imageNamed:@"http://image.sjrjy.com/201108/04143132ee3ada5a130861.jpg"]];

    self.scrollView.bounces = YES;
    self.scrollView.pagingEnabled = YES;
    self.scrollView.delegate = self;
    self.scrollView.userInteractionEnabled = YES;
    self.scrollView.showsHorizontalScrollIndicator = NO;

//    [self.view addSubview:scrollView];
//    [scrollView addSubview:imageView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat pageWidth = self.scrollView.frame.size.width;
    // 在滚动超过页面宽度的50%的时候，切换到新的页面
    int page = floor((self.scrollView.contentOffset.x + pageWidth/2)/pageWidth) ;
    self.pageControl.currentPage = page;
}


- (IBAction)changePage:(id)sender {
    // 更新Scroll View到正确的页面
    CGRect frame;
    frame.origin.x = self.scrollView.frame.size.width * self.pageControl.currentPage;
    frame.origin.y = 0;
    frame.size = self.scrollView.frame.size;
    [self.scrollView scrollRectToVisible:frame animated:YES];
}


@end
