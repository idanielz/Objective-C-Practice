//
//  RegisterViewController.h
//  LoginDemo
//
//  Created by DanielZ on 13-12-24.
//  Copyright (c) 2013年 DanielZ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RegisterViewController : UIViewController
@property (strong, nonatomic) IBOutlet UITextField *accountField;
@property (strong, nonatomic) IBOutlet UITextField *firstPassField;
@property (strong, nonatomic) IBOutlet UITextField *secondPassField;
@property (strong, nonatomic) NSMutableDictionary *userDict;
@property (strong, nonatomic) NSString *userInfoFile;
- (IBAction)registerAccount:(id)sender;
@end
