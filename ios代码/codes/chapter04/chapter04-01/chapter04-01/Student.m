//
//  Student.m
//  chapter04-01
//
//  Created by amaker on 2/28/13.
//  Copyright (c) 2013 amaker. All rights reserved.
//

#import "Student.h"
@implementation Student
// 实现姓名的赋值方法
-(void)setName:(NSString *)myName{
    name = myName;
}
// 实现姓名取值方法
-(NSString*)name{
    return name;
}
// 实现sid的赋值方法
-(void)setSid:(int)mySid{
    sid = mySid;
}
// 实现sid的取值方法
-(int)sid{
    return sid;
}
@end
