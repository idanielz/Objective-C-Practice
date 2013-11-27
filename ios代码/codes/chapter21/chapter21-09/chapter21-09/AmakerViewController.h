//
//  AmakerViewController.h
//  chapter21-09
//
//  Created by amaker on 4/10/13.
//  Copyright (c) 2013 amaker. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MobileCoreServices/MobileCoreServices.h>
#import <AssetsLibrary/AssetsLibrary.h>
@interface AmakerViewController : UIViewController<UIImagePickerControllerDelegate,UINavigationControllerDelegate>
// 拍照
- (IBAction)take:(id)sender;
// 显示照片
@property (strong, nonatomic) IBOutlet UIImageView *pic;
@end
