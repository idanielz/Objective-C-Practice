//
//  main.m
//  Callbacks
//
//  Created by DanielZ on 13-11-21.
//  Copyright (c) 2013年 DanielZ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Logger.h"
int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        Logger *logger = [[Logger alloc] init];
        
        NSURL *url = [NSURL URLWithString:@"http://down1.zol.com.cn/bofang/rmvb-play.zip?key=83e59e0cfd8c08e3cf6e848745a55869"];//@"http://www.gutenberg.org/cache/epub/205/pg205.txt"];
        NSURLRequest *request = [NSURLRequest requestWithURL:url];
        
        
        //1.目标-动作对，回调，对于只做一件事情的对象
        __unused NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:2.0 target:logger selector:@selector(sayOuch:) userInfo:nil repeats:YES];
        
        //2.委托对象，回调，对于功能更复杂的对象，使用辅助对象（最常用的是委托对象）
        __unused NSURLConnection *fetchConn = [[NSURLConnection alloc] initWithRequest:request delegate:logger startImmediately:YES];
        
        //3.通告，回调，对于要触发多个（其他对象中的）回调
        [[NSNotificationCenter defaultCenter] addObserver:logger selector:@selector(zoneChange:) name:NSSystemTimeZoneDidChangeNotification object:nil];
        [[NSRunLoop currentRunLoop] run];
        
    }
    return 0;
}

