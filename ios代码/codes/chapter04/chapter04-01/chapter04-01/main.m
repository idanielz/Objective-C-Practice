//
//  main.m
//  chapter04-01
//
//  Created by amaker on 2/28/13.
//  Copyright (c) 2013 amaker. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Employee.h"
#import "Student.h"
#import "Customer.h"
#import "Teacher.h"
int main(int argc, const char * argv[])
{
    @autoreleasepool {
        Employee *emp = [[Employee alloc]init];
        // 必须实例化才能调用
        [emp instanceMethod];
        // 通过类名称就可以调用
        [Employee classMethod];
        
        // 实例化第一个学生
        Student *s1 = [[Student alloc]init];
        // 调用赋值方法赋值
        [s1 setSid:1];
        [s1 setName:@"tom"];
        // 调用取值方法取值
        int sid1 = [s1 sid];
        NSString *name1 = [s1 name];
        // 输出sid和name
        NSLog(@"%d,%@",sid1,name1);
        
        // 实例化第二个学生
        Student *s2 = [[Student alloc]init];
        [s2 setSid:2];
        [s2 setName:@"kite"];
        
        NSLog(@"%d,%@",[s2 sid],[s2 name]);
        
        // 多参数方法的调用
        Student *s3 = [[Student alloc]init];
        [s3 setSid:3 andName:@"rose"];
        
        // 多参数初始化方法
        Customer *c = [[Customer alloc]initWithCid:1 andName:@"tom" andEmail:@"tom@gmail.com"];
        [c printMsg];
        
        Teacher *t = [[Teacher alloc]init];
        t.tid = 1;
        t.name = @"kite";
        t.age = 30;
        
        NSLog(@"%d,%@,%d",t.tid,t.name,t.age);
        
        
    }
    return 0;
}

