//
//  Person.h
//  MyDemo
//
//  Created by Mahmood1 on 10/11/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
// 实现NSCopying协议
@interface Person : NSObject <NSCopying>
// age 属性
@property int age;
// name属性
@property (nonatomic,copy) NSString *name;
@end
