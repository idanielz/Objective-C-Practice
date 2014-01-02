//
//  Mother.m
//  NSNotificationDemo
//
//  Created by DanielZ on 13-12-11.
//  Copyright (c) 2013年 DanielZ. All rights reserved.
//

#import "Mother.h"

@implementation Mother

@synthesize sleep;

- (id)init{
    self = [super init];
    if (self)
    {
        sleep = 0;
        [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(sleepaction:) userInfo:nil repeats:YES];
        
    }
    return self;
}

- (void)sleepaction:(NSTimer *)timer{
    sleep += 10;
    if(sleep % 30 == 0 ){
        [[NSNotificationCenter defaultCenter]postNotificationName:NOTIFICATION_NAME object:[NSNumber numberWithInteger:sleep]];
    }
}
@end
