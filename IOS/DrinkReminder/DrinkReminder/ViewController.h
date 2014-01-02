//
//  ViewController.h
//  DrinkReminder
//
//  Created by DanielZ on 13-12-17.
//  Copyright (c) 2013年 DanielZ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (strong, nonatomic) IBOutlet UILabel *MinuteLabel;
@property (strong, nonatomic) IBOutlet UILabel *SecondLabel;
@property (strong, nonatomic) IBOutlet UIButton *startButton;

@property (strong, nonatomic) IBOutlet UIDatePicker *TimeCount;

@property (nonatomic) NSInteger minutes;
@property (nonatomic) NSInteger seconds;
@property (nonatomic) NSTimer *timer;
- (IBAction)StartCounting:(id)sender;
- (IBAction)StopCounting:(id)sender;
@end
