//
//  AmakerViewController.m
//  MultiMedia_Video
//
//  Created by Mahmood1 on 10/28/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "AmakerViewController.h"

@implementation AmakerViewController

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
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
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (IBAction)play:(id)sender {
    // 获得播放视频文件路径
    NSURL *path = [NSURL fileURLWithPath:[[NSBundle mainBundle]pathForResource:@"syz" ofType:@"mp4"]];
    // 实例化视频播放器
    self.mp = [[MPMoviePlayerController alloc]initWithContentURL:path];
    // 设置控制样式
    self.mp.controlStyle = MPMovieControlStyleDefault;
    // 设置是否自动播放
    self.mp.shouldAutoplay = YES;
    // 添加播放视图到当前视图
    [self.view addSubview:self.mp.view];
    // 设置全屏
    [self.mp setFullscreen:YES animated:YES];
}
// 播放结束删除视图
- (void)mediaPickerDidCancel:(MPMediaPickerController *)mediaPicker{
    [self.mp.view removeFromSuperview];
}


@end
