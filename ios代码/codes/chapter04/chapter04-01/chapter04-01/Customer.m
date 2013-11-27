//
//  Customer.m
//  chapter04-01
//
//  Created by amaker on 2/28/13.
//  Copyright (c) 2013 amaker. All rights reserved.
//

#import "Customer.h"

@implementation Customer
// 打印信息
-(void)printMsg{
    NSLog(@"%d,%@,%@",cid,name,email);
}
// 初始化方法
-(id)init{
    // 调用父类的初始化方法
    self = [super init];
    // 如果父类初始化成功
    if (self) {
        // 初始化子类
        cid = 1;
        name = @"tom";
        email = @"tom@gmail.com";
    }
    return self;
}
// 多参数初始化方法的实现
-(id)initWithCid:(int)myCid andName:(NSString *)myName andEmail:(NSString *)myEmail{
    self = [super init];
    if (self) {
        cid = myCid;
        name = myName;
        email = myEmail;
    }
    return self;
}


@end
