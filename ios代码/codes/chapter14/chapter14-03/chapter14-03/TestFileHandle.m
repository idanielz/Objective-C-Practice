//
//  TestFileHandle.m
//  chapter14-03
//
//  Created by amaker on 3/11/13.
//  Copyright (c) 2013 amaker. All rights reserved.
//

#import "TestFileHandle.h"

@implementation TestFileHandle
-(void)readFile{
    NSFileHandle *readFile;
    NSData *buffer;
    // 1. 实例化
    readFile = [NSFileHandle fileHandleForReadingAtPath:@"/tmp/Hello.txt"];
    // 读文件直到文件尾部
    buffer = [readFile readDataToEndOfFile];
    // 将NSData 转换为字符串
    NSString *temp = [[NSString alloc]initWithData:buffer encoding:NSUTF8StringEncoding];
    // 关闭文件
    [readFile closeFile];
    // 显示文件内容
    NSLog(@"%@",temp);
}
-(void)writeFile{
    // 创建写文件处理器
    NSFileHandle *writeFile = [NSFileHandle fileHandleForWritingAtPath:@"/tmp/newFile"];
    // 将字符串转换为NSData
    NSString *temp2 = @"Hello everyone!";
    NSData *buffer2 = [temp2 dataUsingEncoding:NSUTF8StringEncoding];
    // 写NSData
    [writeFile writeData:buffer2];
    // 关闭文件
    [writeFile closeFile];
}

@end
