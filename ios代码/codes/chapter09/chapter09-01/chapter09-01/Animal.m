//
//  Animal.m
//  chapter09-01
//
//  Created by amaker on 4/17/13.
//  Copyright (c) 2013 amaker. All rights reserved.
//

#import "Animal.h"
@implementation Animal
// 显示姓名和年龄方法
-(void)display{
    NSLog(@"name=%@,age=%d",self.name,self.age);
}
- (id)init
{
    self = [super init];
    if (self) {
        self.name = @"动物";
        self.age = 1;
    }
    return self;
}
@end
