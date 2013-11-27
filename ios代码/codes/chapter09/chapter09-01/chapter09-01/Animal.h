//
//  Animal.h
//  chapter09-01
//
//  Created by amaker on 4/17/13.
//  Copyright (c) 2013 amaker. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Animal : NSObject
// 姓名属性
@property(nonatomic,strong) NSString *name;
// 年龄属性
@property(nonatomic)int age;
// 显示姓名和年龄方法
-(void)display;
@end
