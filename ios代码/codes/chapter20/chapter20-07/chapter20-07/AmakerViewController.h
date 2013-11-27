//
//  AmakerViewController.h
//  chapter20-07
//
//  Created by amaker on 4/23/13.
//  Copyright (c) 2013 amaker. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface AmakerViewController : UIViewController
// 图片属性
@property (strong, nonatomic) IBOutlet UIImageView *myImage;
// 移动事件方法
- (IBAction)move:(id)sender;
@end
