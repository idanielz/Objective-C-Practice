//
//  Son.m
//  NSNotificationDemo
//
//  Created by DanielZ on 13-12-11.
//  Copyright (c) 2013年 DanielZ. All rights reserved.
//

#import "Son.h"
@implementation Son

- (id)init{
    self = [super init];
    if (self){
        [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(wake:) name:NOTIFICATION_NAME object:nil];
    }
    return self;
}

- (void)wake:(NSNotification *)notification{
    NSNumber *number = notification.object;
    NSLog(@"time to get up! num = %@", number);
}
@end
