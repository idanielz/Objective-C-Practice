//
//  main.m
//  MultiMedia_Audio
//
//  Created by Mahmood1 on 10/28/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "AmakerAppDelegate.h"

int main(int argc, char *argv[])
{
    @autoreleasepool {
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AmakerAppDelegate class]));
    }
}


/******本节内容提要************/
// 1. 添加AVFoundation.framework 框架
// 2. 声明AVAudioPlayer 实现AVAudioPlayerDelegate协议
// 3. 生命NSURL对象指向声音资源
// 4. 调用AVAudioPlayer方法播放声音
