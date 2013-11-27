//
//  AmakerViewController.h
//  chapter21-10
//
//  Created by amaker on 4/10/13.
//  Copyright (c) 2013 amaker. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AssetsLibrary/AssetsLibrary.h>
#import <MobileCoreServices/MobileCoreServices.h>
#import <MediaPlayer/MediaPlayer.h>

@interface AmakerViewController : UIViewController<UINavigationControllerDelegate,UIImagePickerControllerDelegate>
// 录像事件方法
- (IBAction)start:(id)sender;
// 播放事件方法
- (IBAction)play:(id)sender;
// 视频播放器属性
@property(nonatomic,strong)MPMoviePlayerController *mPlayer;
// 当前url路径
@property(nonatomic,strong)NSURL *currentURL;
@end
