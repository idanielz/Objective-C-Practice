//
//  MyOpetation.m
//  chapter25-05
//
//  Created by amaker on 4/22/13.
//  Copyright (c) 2013 amaker. All rights reserved.
//

#import "MyOpetation.h"
@implementation MyOpetation
// 实现初始化方法
-(id)initWithName:(NSString*)name{
    self = [super init];
    if (self) {
        self.name = name;
    }
    return self;
}
// 覆盖main方法
-(void)main{
    // 循环打印那个操作在执行
    for (int i=0; i<10; i++) {
        [NSThread sleepForTimeInterval:1];
        NSLog(@"%@'s i=%d",self.name,i);
    }
}
@end
