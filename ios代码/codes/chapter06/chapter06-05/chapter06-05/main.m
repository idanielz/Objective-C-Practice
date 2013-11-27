//
//  main.m
//  chapter06-05
//
//  Created by amaker on 4/22/13.
//  Copyright (c) 2013 amaker. All rights reserved.
//

#import <Foundation/Foundation.h>
int main(int argc, const char * argv[])
{
    @autoreleasepool {
        // 声明三个变量i，j，k
        int i=1,j=2,k=3;
        // 进行逻辑运算（短路与运算）
		BOOL r = (i>j)&&(++i<k);
		NSLog(@"r=%@",r?@"YES":@"NO");
        NSLog(@"i=%d",i);
        
        NSLog(@"---------------");
        
		r = (i>j)&(++i<k);
		NSLog(@"r=%@",r?@"YES":@"NO");
        NSLog(@"i=%d",i);
        
		NSLog(@"--------------");
        
		if((i>j)&&(++i<k))
			NSLog(@"i=%d",i);
    }
    return 0;
}

