//
//  ScrollViewController.h
//  ScrollImages
//
//  Created by DanielZ on 14-1-2.
//  Copyright (c) 2014年 DanielZ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ScrollViewController : UIViewController<UIScrollViewDelegate>
@property (strong,nonatomic) IBOutlet UIScrollView *scrollView;
@property (strong,nonatomic) IBOutlet UIPageControl *pageControl;
@property (strong,nonatomic) NSMutableArray *imageArray;

@end
