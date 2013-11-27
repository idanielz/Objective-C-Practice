//
//  AmakerViewController.m
//  chapter21-09
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
    // 获得拍照的图片
    UIImage *myImage =
    [info objectForKey:
     UIImagePickerControllerOriginalImage];
    // 设置UIImageView的属性
    self.pic.image = myImage;
    // 取消显示
    [picker dismissViewControllerAnimated:YES completion:nil];
}
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker;{
    NSLog(@"imagePickerControllerDidCancel");
}

- (IBAction)take:(id)sender {
    // 实例化UIImagePickerController
    UIImagePickerController *controller =
    [[UIImagePickerController alloc] init];
    // 设置图片源类型为照相机输入源
    controller.sourceType = UIImagePickerControllerSourceTypeCamera;
    // 媒体类型
    NSString *requiredMediaType = (__bridge NSString *)kUTTypeImage;
    // 设置媒体类型
    controller.mediaTypes = [[NSArray alloc]
                             initWithObjects:requiredMediaType, nil];
    // 是否运行编辑
    controller.allowsEditing = YES;
    // 设置代理
    controller.delegate = self;
    // 跳转到该控制器
    [self presentViewController:controller animated:YES completion:nil];
}
@end
