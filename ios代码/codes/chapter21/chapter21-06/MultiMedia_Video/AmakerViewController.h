//
//  AmakerViewController.h
//  MultiMedia_Video
//
//  Created by Mahmood1 on 10/28/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
// 导入视频播放器头文件
#import <MediaPlayer/MediaPlayer.h>
// 实现MPMediaPickerControllerDelegate协议
@interface AmakerViewController : UIViewController<MPMediaPickerControllerDelegate>{
    
}
// 播放器属性
@property(nonatomic,strong) MPMoviePlayerController *mp;
// 播放方法
- (IBAction)play:(id)sender;
@end
