//
//  Employee.h
//  chapter04-01
//
//  Created by amaker on 2/28/13.
//  Copyright (c) 2013 amaker. All rights reserved.
//

#import <Foundation/Foundation.h>
@interface Employee : NSObject
{
    // 实例变量员工编号
    int eid;
    // 实例变量员工姓名
    NSString *name;
}
// 实例方法
-(void)instanceMethod;
// 类方法
+(void)classMethod;
@end
