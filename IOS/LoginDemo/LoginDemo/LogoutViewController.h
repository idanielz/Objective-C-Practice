//
//  LogoutViewController.h
//  LoginDemo
//
//  Created by DanielZ on 13-12-24.
//  Copyright (c) 2013年 DanielZ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LoginViewController.h"
@interface LogoutViewController : UIViewController <UIAlertViewDelegate, LoginDelegate>

@property (strong, nonatomic) IBOutlet UILabel *userLabel;
@property (strong, nonatomic) IBOutlet NSString *user;

//- (IBAction)dragBack:(id)sender;
- (IBAction)backToLogin:(id)sender;
- (IBAction)deleteAllAccount:(id)sender;
- (IBAction)deleteAccount:(id)sender;
- (void)setUsername:(NSString *)name;
@end
