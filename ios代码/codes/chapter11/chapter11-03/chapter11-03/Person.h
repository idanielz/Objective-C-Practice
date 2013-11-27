//
//  Person.h
//  chapter11-03
//
//  Created by amaker on 5/15/13.
//  Copyright (c) 2013 amaker. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject
// 直接赋值
@property(nonatomic,assign)NSString *pid;
// name引用+1
@property(nonatomic,retain)NSString *name;
// 拷贝 如果属性是可变属性例如 NSMutableArray 或者 NSMutableString等
@property(nonatomic,copy)NSString *email;
// strong 和 weak 用在ARC的情况下,在arc情况下strong = retain
// 强引用 
@property(nonatomic,strong)NSString *firstName;
// 弱引用 避免循环引用
@property(nonatomic,weak)NSString *lastName;
@end
