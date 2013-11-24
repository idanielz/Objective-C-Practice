//
//  ZJDViewController.h
//  HelloWorld
//
//  Created by DanielZ on 13-11-23.
//  Copyright (c) 2013年 DanielZ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZJDViewController : UIViewController <UITextFieldDelegate, UIAlertViewDelegate>
@property (weak, nonatomic) IBOutlet UILabel *myLabel;
@property (weak, nonatomic) IBOutlet UIButton *myButton;
@property (weak, nonatomic) IBOutlet UITextField *myText;
- (IBAction)onClick:(id)sender;

- (NSString *)getFullName : (NSString *) firstName LastName : (NSString *) lastName;
@end
