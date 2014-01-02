//
//  ViewController.h
//  AlertAndSheetViewDemo
//
//  Created by DanielZ on 13-12-8.
//  Copyright (c) 2013年 DanielZ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UIAlertViewDelegate,UIActionSheetDelegate>
@property (strong, nonatomic) IBOutlet UILabel *showResult;
@property (strong, nonatomic) IBOutlet UIToolbar *myToolbar;

- (IBAction)showAlert:(id)sender;
- (IBAction)showSheet:(id)sender;

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex;

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex;
@end
