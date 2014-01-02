//
//  ViewController.m
//  AlertAndSheetViewDemo
//
//  Created by DanielZ on 13-12-8.
//  Copyright (c) 2013年 DanielZ. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize showResult,myToolbar;
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

- (IBAction)showAlert:(id)sender {
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Alert" message:@"are u sure?" delegate:self cancelButtonTitle:@"cancel" otherButtonTitles:@"YES", @"other", nil];
    [alert show];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    showResult.text = [NSString stringWithFormat:@"%i" ,buttonIndex];
}
- (IBAction)showSheet:(id)sender {
    UIActionSheet *sheet = [[UIActionSheet alloc]initWithTitle:@"sheet" delegate:self cancelButtonTitle:@"cancel" destructiveButtonTitle:@"distruct" otherButtonTitles:@"other", nil];
//    [sheet showInView:self.view];
    [sheet showFromToolbar:myToolbar];
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    showResult.text = [NSString stringWithFormat:@"%i",buttonIndex];
}
@end
