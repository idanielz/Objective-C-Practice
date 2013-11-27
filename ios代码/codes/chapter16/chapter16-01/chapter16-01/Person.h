//
//  Person.h
//  MyDemo
//
//  Created by Mahmood1 on 10/11/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
// 实现NSCoding协议
@interface Person : NSObject <NSCopying,NSCoding>
{
    int age;
    NSString *name;
}
@property int age;
@property (nonatomic,copy) NSString *name;
@end
