//
//  AmakerViewController.h
//  MultiMedia_Audio
//
//  Created by Mahmood1 on 10/28/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
// 导入头文件
#import <AVFoundation/AVFoundation.h>
@interface AmakerViewController : UIViewController{
    
}
// 播放方法
- (IBAction)play:(id)sender;
// 停止播放方法
- (IBAction)stop:(id)sender;
// 音量控制滑块
@property (strong, nonatomic) IBOutlet UISlider *mySlider;
// 音乐播放器类
@property(strong,nonatomic) AVAudioPlayer *myPlayer;
@end
