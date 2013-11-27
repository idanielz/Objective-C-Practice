//
//  AmakerViewController.m
//  chapter29-03
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
            [self createNewPeople:@"Tom" phoneNumber:@"13800" inAddressBook:addressBook];
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
                    [self createNewPeople:@"Tom" phoneNumber:@"13800" inAddressBook:addressBook];
                } else {
                    NSLog(@"拒绝访问");
                }
            });
            break;
    }
}

// 添加一个新的联系人
- (ABRecordRef) createNewPeople:(NSString *)name
                              phoneNumber:(NSString *)phoneNumber
                         inAddressBook:(ABAddressBookRef)paramAddressBook{
    
    ABRecordRef result = NULL;
    // 创建一个Person记录
    result = ABPersonCreate();
    
    BOOL couldSetName = NO;
    BOOL couldSetPhone = NO;
    // 设置Lastname值
    couldSetName = ABRecordSetValue(result,
                                         kABPersonLastNameProperty,
                                         (__bridge CFTypeRef)name,
                                         NULL);
    // 设置电话号码
    
    ABMutableMultiValueRef multiPhone = ABMultiValueCreateMutable(kABMultiStringPropertyType);
    
     couldSetPhone = ABMultiValueAddValueAndLabel(multiPhone, (__bridge CFTypeRef)(phoneNumber), kABPersonPhoneMobileLabel, NULL);
    
    ABRecordSetValue(result, kABPersonPhoneProperty, multiPhone,nil);

    // 添加新记录
    BOOL couldAddPerson = ABAddressBookAddRecord(paramAddressBook,result,nil);
    
    if (couldAddPerson){
        NSLog(@"添加成功！");
    } else {
        NSLog(@"添加失败！");
        CFRelease(result);
        result = NULL;
        return result;
    }
    
    // 判断是否有未保存内容
    if (ABAddressBookHasUnsavedChanges(paramAddressBook)){
        CFErrorRef couldSaveAddressBookError = NULL;
        // 保存更新
        BOOL couldSaveAddressBook = ABAddressBookSave(paramAddressBook,
                                                      &couldSaveAddressBookError);
        if (couldSaveAddressBook){
            NSLog(@"保存成功！");
        } else {
            NSLog(@"保存失败！");
        }
    }
    
    return result;
}

- (IBAction)create:(id)sender {
    [self check];
}



@end
