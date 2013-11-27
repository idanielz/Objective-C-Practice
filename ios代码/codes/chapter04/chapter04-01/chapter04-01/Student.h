//
//  Student.h
//  chapter04-01
//
//  Created by amaker on 2/28/13.
//  Copyright (c) 2013 amaker. All rights reserved.
//

#import <Foundation/Foundation.h>
@interface Student : NSObject
{
    // 实例变量，学生编号
    int sid;
    // 实例变量，学生姓名
    NSString *name;
}
// 赋值方法，传递int类型的参数mySid
-(void)setSid:(int)mySid;
// 取值方法，返回int类型的学生编号
-(int)sid;
// 赋值方法，传递NSString类型的参数myName
-(void)setName:(NSString*)myName;
// 取值方法，返回NSString类型的学生姓名
-(NSString*)name;

// 多参数方法定义
-(void)setSid:(int)mySid andName:(NSString*)myName;

@end
