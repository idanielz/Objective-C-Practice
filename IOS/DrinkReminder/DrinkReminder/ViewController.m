//
//  ViewController.m
//  DrinkReminder
//
//  Created by DanielZ on 13-12-17.
//  Copyright (c) 2013年 DanielZ. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize SecondLabel,MinuteLabel,minutes,seconds,TimeCount,timer,startButton;

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



- (IBAction)StartCounting:(id)sender {
    if (startButton == nil) {
    startButton = [[UIButton alloc]init];
    }
    [TimeCount setHidden:YES];
    if( [@"Start" isEqual: startButton.currentTitle])
    {
        [startButton setTitle:@"Pause" forState:UIControlStateNormal];
        NSCalendar *gregorian = [[NSCalendar alloc]initWithCalendarIdentifier:NSGregorianCalendar];
        NSDateComponents *timeStandard = [gregorian components:NSHourCalendarUnit|NSMinuteCalendarUnit fromDate:[TimeCount date]];
        NSLog(@"%lu",[timeStandard minute] );
        minutes = ([timeStandard minute]-1)+60*[timeStandard hour];
        seconds = 60;
        MinuteLabel.text = [NSString stringWithFormat:@"%ld", minutes];
        SecondLabel.text = @"00";
        timer = [NSTimer scheduledTimerWithTimeInterval:1/10.0 target:self selector:@selector(timeCounting) userInfo:nil repeats:YES];
    }
    else if( [@"Pause" isEqual: startButton.currentTitle]){
        [startButton setTitle:@"Continue" forState:UIControlStateNormal];
        [timer setFireDate:[NSDate distantFuture]];
    }
    else{
        [startButton setTitle:@"Pause" forState:UIControlStateNormal];
        [timer setFireDate:[NSDate distantPast]];
    }
}

- (IBAction)StopCounting:(id)sender {
    [startButton setTitle:@"Start" forState:UIControlStateNormal];
    [TimeCount setHidden:NO];
    [timer invalidate];
    timer = nil;
}

- (void)timeCounting
{
    NSLog(@"%ld",seconds );
    seconds--;
    SecondLabel.text = [NSString stringWithFormat:@"%ld", seconds];
    
    if (minutes == 0 && seconds ==0) {
        [startButton setTitle:@"Start" forState:UIControlStateNormal];
        [TimeCount setHidden:NO];
        [timer invalidate];
        timer = nil;
        
    }
    else if (seconds == 0) {
        seconds = 60;
        minutes--;
        MinuteLabel.text =[NSString stringWithFormat:@"%ld", minutes];
    }
}


@end
