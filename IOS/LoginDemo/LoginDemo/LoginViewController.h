//
//  LoginViewController.h
//  LoginDemo
//
//  Created by DanielZ on 13-12-24.
//  Copyright (c) 2013年 DanielZ. All rights reserved.
//
@protocol LoginDelegate <NSObject>

- (void)setUsername:(NSString *)name;

@end

#import <UIKit/UIKit.h>
@interface LoginViewController : UIViewController<UITextFieldDelegate>

@property (strong, nonatomic) IBOutlet UITextField *accountField;
@property (strong, nonatomic) IBOutlet UITextField *passwordField;
@property (strong, nonatomic) NSMutableDictionary *userDict;
@property (strong, nonatomic) NSString *userInfoFile;
@property (strong, nonatomic) NSArray *defaultUserInfo;
@property (strong, nonatomic) NSUserDefaults *userDefaults;
@property (strong, nonatomic)id<LoginDelegate> SetDelegate;

- (IBAction)login:(id)sender;
- (IBAction)accountEndEdit:(id)sender;
- (IBAction)touchBackground:(id)sender;

@end
