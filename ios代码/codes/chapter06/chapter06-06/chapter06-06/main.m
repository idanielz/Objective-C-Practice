//
//  main.m
//  chapter06-06
//
//  Created by amaker on 4/22/13.
//  Copyright (c) 2013 amaker. All rights reserved.
//

#import <Foundation/Foundation.h>
int main(int argc, const char * argv[])
{
    @autoreleasepool {
        int i = 5; // 0101
		int j = 9; // 1001
		int a = 2; // 0010
		int b = 8; // 1000
		int k = 0;
		k = i&j; // 0001
		NSLog(@"k=%d",k);
		k = i|j; // 1101
		NSLog(@"k=%d",k);
		k = ~i; //
		NSLog(@"k=%d",k);
		k = a<<2; // 1000
		NSLog(@"k=%d",k);
		k = b>>2; // 0010
		NSLog(@"k=%d",k);
    }
    return 0;
}

