//
//  Person.h
//  chapter09-03
//
//  Created by amaker on 4/18/13.
//  Copyright (c) 2013 amaker. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Dog.h"
#import "Cat.h"
#import "Bird.h"

@interface Person : NSObject
// 姓名
@property(nonatomic,strong)NSString *name;
// 关联dog
@property(nonatomic,strong)Dog *dog;
// 关联cat
@property(nonatomic,strong)Cat *cat;
// 关联bird
@property(nonatomic,strong)Bird *bird;
-(void)display;
@end
