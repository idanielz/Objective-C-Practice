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
    // 实例化音乐播放器
    myPlayer = [[AVAudioPlayer alloc]initWithContentsOfURL:url error:nil];
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

// 播放方法实现
- (IBAction)play:(id)sender {
    if (myPlayer!=nil) {
        // 启动另外一个线程来播放，是程序更加流畅
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
             [myPlayer play];
        });
    }
}
// 停止播放方法实现
- (IBAction)stop:(id)sender {
    if (myPlayer!=nil) {
        [myPlayer stop];
    }
}
// 改变音量
- (IBAction)change:(id)sender {
    if (myPlayer!=nil) {
        myPlayer.volume = mySlider.value;
    }
}

@end
