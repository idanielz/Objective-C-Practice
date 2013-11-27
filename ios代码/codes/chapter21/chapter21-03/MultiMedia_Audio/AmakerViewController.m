//
//  AmakerViewController.m
//  MultiMedia_Audio
//
//  Created by Mahmood1 on 10/28/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "AmakerViewController.h"

@implementation AmakerViewController
@synthesize mySlider;
@synthesize myPlayer;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // 音乐路径
    NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle]pathForResource:@"test" ofType:@"mp3"]];
    // 实例化播放器
    myPlayer = [[AVAudioPlayer alloc]initWithContentsOfURL:url error:nil];
    // 指定代理
    myPlayer.delegate = self;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

// 播放方法
- (IBAction)play:(id)sender {
    if (myPlayer!=nil) {
        // 在另外一个线程中播放音乐
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            [myPlayer play];
        });
    }
}
// 停止播放方法
- (IBAction)stop:(id)sender {
    if (myPlayer!=nil) {
        [myPlayer stop];
    }
}
// 调节音量方法
- (IBAction)change:(id)sender {
    if (myPlayer!=nil) {
        myPlayer.volume = mySlider.value;
    }
}

// 音乐被中断
- (void)audioPlayerBeginInterruption:(AVAudioPlayer *)player{
    NSLog(@"audioPlayerBeginInterruption...");
}

// 继续播放
- (void)audioPlayerEndInterruption:(AVAudioPlayer *)player withOptions:(NSUInteger)flags{
    if (flags == AVAudioSessionInterruptionFlags_ShouldResume && player != nil){
        [player play];
    }
}



@end
