//
//  AmakerViewController.m
//  chapter29-02
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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

// 使用UIAlertView，显示信息
-(void)showMsg:(NSString*)msg{
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:nil message:msg delegate:nil cancelButtonTitle:@"Cancel" otherButtonTitles:nil, nil];
    [alert show];
}

// 检查是否允许访问联系人
- (void)check{
    // 获得授权状态值
    int result = ABAddressBookGetAuthorizationStatus();
    // 判断
    switch (result) {
        case kABAuthorizationStatusAuthorized:
            // 创建ABAddressBookRef引用
            addressBook = ABAddressBookCreateWithOptions(NULL, nil);
            // 读取所有联系人
            [self read:addressBook];
            break;
        case kABAuthorizationStatusRestricted:
            [self showMsg:@"访问受限"];
            break;
        case kABAuthorizationStatusDenied:
            [self showMsg:@"拒绝访问"];
            break;
            // 授权
        case kABAuthorizationStatusNotDetermined:
            // 创建ABAddressBookRef引用
            addressBook = ABAddressBookCreateWithOptions(NULL, nil);
            ABAddressBookRequestAccessWithCompletion
            (addressBook, ^(bool granted, CFErrorRef error) {
                if (granted){
                    // 如果允许访问，读取所有联系人
                    [self read:addressBook];
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

- (void) read:(ABAddressBookRef)ab{
    // 获得所有联系人
    NSArray *peoples = (__bridge_transfer NSArray *)
    ABAddressBookCopyArrayOfAllPeople(ab);
    // 遍历
    NSUInteger i = 0;
    for (i = 0;i < [peoples count];i++){
        // 获得联系人信息
        ABRecordRef per = (__bridge ABRecordRef)[peoples objectAtIndex:i];
        // 获得lastname
        NSString *firstName = (__bridge_transfer NSString *)ABRecordCopyValue(per, kABPersonFirstNameProperty);
        // 输出lastname
        NSLog(@"Name = %@", firstName);
        // 获得电话号码，因为电话号码有多个，所以返回ABMultiValueRef
        ABMultiValueRef phone = ABRecordCopyValue(per, kABPersonPhoneProperty);
        
        // 遍历电话号码
        NSUInteger j = 0;
        for (j = 0;j < ABMultiValueGetCount(phone);j++){
            // 获得电话号码标签，例如：手机、办公电话等
            NSString *phoneLabel = (__bridge_transfer NSString *)
            ABMultiValueCopyLabelAtIndex(phone, j);
            // 获得电话号码
            NSString *phoneNumber = (__bridge_transfer NSString *)
            ABMultiValueCopyValueAtIndex(phone, j);
            // 输出电话标签和号码
            NSLog(@"Label = %@, phoneNumber = %@",phoneLabel,phoneNumber);
        }
    }
}

- (IBAction)get:(id)sender {
    [self check];
}
@end
