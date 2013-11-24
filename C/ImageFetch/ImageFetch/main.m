//
//  main.m
//  ImageFetch
//
//  Created by DanielZ on 13-11-12.
//  Copyright (c) 2013年 DanielZ. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        // insert code here...
        NSURL *url = [NSURL URLWithString:@"http://www.baidu.com/img/bdlogo.gif"];
        NSURLRequest *request = [NSURLRequest requestWithURL:url];
        NSError *error = nil;
        NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:NULL error:&error];
        if(!data){
            NSLog(@"Fetch failed : %@", [error localizedDescription]);
            return 1;
        }
        NSLog(@"The file is %lu bytes", [data length]);
        BOOL written = [data  writeToFile:@"/tmp/baidu.gif" options:0 error:&error];
        if (written)
            NSLog(@"Success!");
        else
        {
            NSLog(@"write failed : %@", [error localizedDescription]);
            return 1;
        }
        NSData *readData = [ NSData dataWithContentsOfFile:@"/tmp/baidu.gif"];
        NSLog(@"The file read from the disk has %lu bytes", [readData length]);
    }
    return 0;
}

