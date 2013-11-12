//
//  main.m
//  Stringz
//
//  Created by DanielZ on 13-11-12.
//  Copyright (c) 2013年 DanielZ. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        // insert code here...
        NSMutableString *str = [[NSMutableString alloc] init];
        for ( int i =0; i < 10 ; i++)
        {
            [str appendString:@"Aaron is cool\n"];
        }
        NSError *error = nil;
        BOOL success = [str writeToFile:@"/abc/cool.txt" atomically:YES encoding:NSUTF8StringEncoding error:&error];
        if (success)
            NSLog(@"done writing /abc/cool.txt");
        else
            NSLog(@"writing failed :%@",[error localizedDescription]);
        
        NSString *str_r = [[NSString alloc] initWithContentsOfFile:@"/etc/hosts" encoding:NSUTF8StringEncoding error:&error];
        if(!str)
            NSLog(@"read failed: %@",[error localizedDescription]);
        else
            NSLog(@"hosts looks like this : %@", str_r);
    }
    return 0;
}

