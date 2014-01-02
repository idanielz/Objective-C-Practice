//
//  ViewController.m
//  UITextFieldDemo
//
//  Created by DanielZ on 13-12-8.
//  Copyright (c) 2013年 DanielZ. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize usernametext, myLabel, segLabel, switchLabel, sliderLabel;
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

- (IBAction)login:(UIButton *)sender {
    NSString *username = usernametext.text;
    NSLog(@"%@", username);
    [usernametext resignFirstResponder];
    myLabel.text = username;
}

- (IBAction)segChanged:(id)sender {
    UISegmentedControl *seg = (UISegmentedControl *)sender;
    NSInteger index = [seg selectedSegmentIndex];
    segLabel.text = [NSString stringWithFormat:@"%d", index];
}

- (IBAction)switchChanged:(id)sender {
    UISwitch *sw = (UISwitch *)sender;
    if(sw.on) switchLabel.text=@"on";
    else switchLabel.text=@"off";
}

- (IBAction)sliderChanged:(id)sender {
    UISlider *sl = (UISlider *)sender;
    [sl setMinimumValue:0];
    [sl setMaximumValue:100];
    sliderLabel.text = [NSString stringWithFormat:@"%d",(int)[sl value]];
}


@end
