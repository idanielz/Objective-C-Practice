//
//  Person.m
//  chapter11-01
//
//  Created by amaker on 4/23/13.
//  Copyright (c) 2013 amaker. All rights reserved.
//

#import "Person.h"

@implementation Person
// 对象被释放
-(void)dealloc{
    [super dealloc];
    NSLog(@"dealloc...");
}
@end
