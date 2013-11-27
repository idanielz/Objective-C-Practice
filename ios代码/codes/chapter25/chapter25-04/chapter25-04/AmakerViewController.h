//
//  AmakerViewController.h
//  chapter25-04
//
//  Created by amaker on 4/22/13.
//  Copyright (c) 2013 amaker. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AmakerViewController : UIViewController
// 进度条属性
@property (strong, nonatomic) IBOutlet UIProgressView *myProgress;
// 启动方法
- (IBAction)start:(id)sender;
@end
