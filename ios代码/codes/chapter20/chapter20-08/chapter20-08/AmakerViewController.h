//
//  AmakerViewController.h
//  chapter20-08
//
//  Created by amaker on 4/23/13.
//  Copyright (c) 2013 amaker. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface AmakerViewController : UIViewController
// 图片属性
@property (strong, nonatomic) IBOutlet UIImageView *myImage;
// 缩放方法
- (IBAction)scale:(id)sender;
//缩放比例大小
@property(nonatomic)float scale;
@end
