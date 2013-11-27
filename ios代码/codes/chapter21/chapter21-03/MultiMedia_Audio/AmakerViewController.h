//
//  AmakerViewController.h
//  MultiMedia_Audio
//
//  Created by Mahmood1 on 10/28/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
// 导入框架
#import <AVFoundation/AVFoundation.h>
// 实现播放器代理协议
@interface AmakerViewController : UIViewController <AVAudioPlayerDelegate>{
}
// 播放方法
- (IBAction)play:(id)sender;
// 停止播放方法
- (IBAction)stop:(id)sender;
// 音量控制滑块
@property (strong, nonatomic) IBOutlet UISlider *mySlider;
// 播放器
@property(retain,nonatomic) AVAudioPlayer *myPlayer;
@end
