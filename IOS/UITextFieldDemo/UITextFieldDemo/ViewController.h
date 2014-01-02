//
//  ViewController.h
//  UITextFieldDemo
//
//  Created by DanielZ on 13-12-8.
//  Copyright (c) 2013年 DanielZ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
//{
//    UITextField *usernametext;
//}

@property (strong, nonatomic) IBOutlet UITextField *usernametext;

@property (strong, nonatomic) IBOutlet UILabel *myLabel;

@property (strong, nonatomic) IBOutlet UILabel *segLabel;
@property (strong, nonatomic) IBOutlet UILabel *switchLabel;
@property (strong, nonatomic) IBOutlet UILabel *sliderLabel;

- (IBAction)login:(UIButton *)sender;
- (IBAction)segChanged:(id)sender;
- (IBAction)switchChanged:(id)sender;
- (IBAction)sliderChanged:(id)sender;


@end
