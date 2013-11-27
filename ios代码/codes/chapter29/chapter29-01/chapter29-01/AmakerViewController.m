//
//  AmakerViewController.m
//  chapter29-01
//
//  Created by amaker on 5/14/13.
//  Copyright (c) 2013 amaker. All rights reserved.
//

#import "AmakerViewController.h"
ABAddressBookRef addressBook;
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

/*
 typedef CF_ENUM(CFIndex, ABAuthorizationStatus) {
 kABAuthorizationStatusNotDetermined = 0,
 kABAuthorizationStatusRestricted,
 kABAuthorizationStatusDenied,
 kABAuthorizationStatusAuthorized
 };
 */
// 显示检测结果信息
-(void)showMsg:(NSString*)msg{
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:nil message:msg delegate:nil cancelButtonTitle:@"Cancel" otherButtonTitles:nil, nil];
    [alert show];
}

// 检查是否允许访问联系人
- (IBAction)check:(id)sender {
    // 获得授权状态值
    int result = ABAddressBookGetAuthorizationStatus();
    // 判断
    switch (result) {
        case kABAuthorizationStatusAuthorized:
            [self showMsg:@"可以访问"];
            break;
        case kABAuthorizationStatusRestricted:
            [self showMsg:@"访问受限"];
            break;
        case kABAuthorizationStatusDenied:
            [self showMsg:@"拒绝访问"];
            break;
        case kABAuthorizationStatusNotDetermined:
            addressBook = ABAddressBookCreateWithOptions(NULL, nil);
            ABAddressBookRequestAccessWithCompletion
            (addressBook, ^(bool granted, CFErrorRef error) {
                if (granted){
                    NSLog(@"允许访问");
                } else {
                    NSLog(@"拒绝访问");
                }
                if (addressBook != NULL){
                    CFRelease(addressBook);
                }
            });
            break;
    }
}
@end
