//
//  ZJDViewController.m
//  HelloWorld
//
//  Created by DanielZ on 13-11-23.
//  Copyright (c) 2013年 DanielZ. All rights reserved.
//

#import "ZJDViewController.h"

@interface ZJDViewController ()

@end

@implementation ZJDViewController
@synthesize myLabel,myButton,myText;

- (void)viewTapped//:(UITapGestureRecognizer *)tapGes
{
    [myText resignFirstResponder];
   // return YES;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [myButton becomeFirstResponder];
    
    UITapGestureRecognizer *tapGr = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(viewTapped)];
    tapGr.cancelsTouchesInView = NO;
    [self.view addGestureRecognizer:tapGr];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onClick:(id)sender {
    NSString *getText = [myText text];
    NSLog(@"%@", getText);
    NSString *full = [self getFullName:getText LastName:@"def"];
    
    [myLabel setText:full];
    [[[UIAlertView alloc] initWithTitle:@"title" message:@"mymessage" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"ok", nil] show ];
    
}

- (NSString *)getFullName:(NSString *)firstName LastName:(NSString *)lastName
{
    NSString *fullName = [NSString stringWithFormat:@"%@ · %@", firstName, lastName];
    return fullName;
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSLog(@"return %i", buttonIndex);
}

@end
