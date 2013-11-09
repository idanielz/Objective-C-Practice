//
//  main.m
//  Live_Time
//
//  Created by DanielZ on 13-10-30.
//  Copyright (c) 2013年 DanielZ. All rights reserved.
//


#import <Foundation/Foundation.h>
int main(int argc, const char * argv[])
{
    @autoreleasepool {
        NSDateComponents *comps = [[NSDateComponents alloc] init];
        [comps setYear:1990];
        [comps setMonth:9];
        [comps setDay:12];
        [comps setHour:1];
        [comps setMinute:0];
        [comps setSecond:0];
        NSCalendar *g = [[NSCalendar alloc] initWithCalendarIdentifier: NSGregorianCalendar];
        NSDate *dateOfBirth = [g dateFromComponents:comps];
        NSDate *now = [NSDate date];
        double d = [now timeIntervalSinceDate:dateOfBirth];
        NSLog(@"%@ %@",dateOfBirth, now);
        NSLog(@"seconds from my birthday is %.2f", d);
    }
    return 0;
}

