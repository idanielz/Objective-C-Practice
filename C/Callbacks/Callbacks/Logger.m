//
//  Logger.m
//  Callbacks
//
//  Created by DanielZ on 13-11-21.
//  Copyright (c) 2013年 DanielZ. All rights reserved.
//

#import "Logger.h"

@implementation Logger

- (void)sayOuch:(NSTimer *)t
{
    NSDate *dt = [[NSDate date] dateWithCalendarFormat:@"%H:%M:%S" timeZone:nil];
    
    NSLog(@"%@ Ouch!",dt);
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    NSLog(@"received %lu bytes", [data length]);
    if(!incomingData){
        incomingData = [[NSMutableData alloc] init];
    }
    
    [incomingData appendData:data];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    NSLog(@"Got it all!");
    NSString *string = [[NSString alloc] initWithData:incomingData encoding:NSUTF8StringEncoding];
    [incomingData writeToFile:@"/tmp/xxxx.txt" atomically:YES];
    incomingData = nil;
    NSLog(@"string has %lu characters", [string length]);    
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    NSLog(@"connection failed: %@", [error localizedDescription]);
    incomingData = nil;
}

- (void)zoneChange:(NSNotification *)note
{
    NSLog(@"The system time zone has changed!!!!!");
}
@end
