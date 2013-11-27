//
//  AmakerViewController.m
//  chapter21-10
//
//  Created by amaker on 4/10/13.
//  Copyright (c) 2013 amaker. All rights reserved.
//

#import "AmakerViewController.h"

@interface AmakerViewController ()

@end

@implementation AmakerViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
    NSLog(@"info=%@",info);
    // 获得媒体类型
    NSString     *mediaType = [info objectForKey:
                               UIImagePickerControllerMediaType];
    // 判断媒体类型是否是视频
    if ([mediaType isEqualToString:(__bridge NSString *)kUTTypeMovie]){
        // 获得视频的路径
        NSURL *urlOfVideo =
        [info objectForKey:UIImagePickerControllerMediaURL];
        self.currentURL = urlOfVideo;
    }
    [picker dismissViewControllerAnimated:YES completion:nil];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{
    NSLog(@"imagePickerControllerDidCancel");
}

- (IBAction)start:(id)sender {
    // 实例化UIImagePickerController
    UIImagePickerController *controller =
    [[UIImagePickerController alloc] init];
    // 设置媒体源类型为录像
    controller.sourceType = UIImagePickerControllerSourceTypeCamera;
    
    NSString *requiredMediaType = (__bridge NSString *)kUTTypeMovie;
    controller.mediaTypes = [[NSArray alloc]
                             initWithObjects:requiredMediaType, nil];
    // 设置是否允许编辑
    controller.allowsEditing = YES;
    // 设置代理
    controller.delegate = self;
    // 录制质量
    controller.videoQuality = UIImagePickerControllerQualityTypeHigh;
    // 最大录制时间
    controller.videoMaximumDuration = 30.0f;
    // 跳转到该控制器
    [self presentViewController:controller animated:YES completion:nil];
}

- (IBAction)play:(id)sender {
    self.mPlayer = [[MPMoviePlayerController alloc]initWithContentURL:self.currentURL];
    // 设置控制样式
    self.mPlayer.controlStyle = MPMovieControlStyleDefault;
    // 设置是否自动播放
    self.mPlayer.shouldAutoplay = YES;
    // 添加播放视图到当前视图
    [self.view addSubview:self.mPlayer.view];
    // 设置全屏
    [self.mPlayer setFullscreen:YES animated:YES];
}

@end
