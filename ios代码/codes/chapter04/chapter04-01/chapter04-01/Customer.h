//
//  Customer.h
//  chapter04-01
//
//  Created by amaker on 2/28/13.
//  Copyright (c) 2013 amaker. All rights reserved.
//

#import <Foundation/Foundation.h>
@interface Customer : NSObject
{
    // 实例变量cid、name和email
    int cid;
    NSString *name;
    NSString *email;
}
// 打印客户信息
-(void)printMsg;

// 多参数初始化方法的定义
-(id)initWithCid:(int)myCid andName:(NSString*)myName andEmail:(NSString*)myEmail;
@end
