//
//  Person.m
//  MyDemo
//
//  Created by Mahmood1 on 10/11/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Person.h"

@implementation Person
@synthesize age;
@synthesize name;

-(void)setName:(NSString *)name1{
    name = [name1 copy];
}
// 覆盖拷贝方法
-(id)copyWithZone:(NSZone *)zone{
    // NSZone是一个内存区域对象
    Person *per = [[Person allocWithZone:zone]init];
    return per;
}
@end
