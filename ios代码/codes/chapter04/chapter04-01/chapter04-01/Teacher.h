//
//  Teacher.h
//  chapter04-01
//
//  Created by amaker on 2/28/13.
//  Copyright (c) 2013 amaker. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Teacher : NSObject
{
    // 实例变量
    int tid;
    NSString *name;
    int age;
}
// 属性，生产赋值和取值方法
@property(nonatomic)int tid;
@property(nonatomic,strong)NSString *name;
@property(unsafe_unretained)int age;
@end
