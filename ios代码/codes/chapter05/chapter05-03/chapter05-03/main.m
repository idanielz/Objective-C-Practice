//
//  main.m
//  chapter05-03
//
//  Created by amaker on 3/2/13.
//  Copyright (c) 2013 amaker. All rights reserved.
//

#import <Foundation/Foundation.h>
int main(int argc, const char * argv[])
{
    @autoreleasepool {
      // char类型
        char c = 'A';
        NSLog(@"%c",c);
      // int类型和char类型可以相互转换
        int i = c;
        NSLog(@"i=%d",i);
      // 转义字符
        char x = '\r';
        NSLog(@"Hello%cWorld",x);
    }
    return 0;
}

