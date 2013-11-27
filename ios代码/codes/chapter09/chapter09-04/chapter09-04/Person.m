//
//  Person.m
//  chapter09-03
//
//  Created by amaker on 4/18/13.
//  Copyright (c) 2013 amaker. All rights reserved.
//

#import "Person.h"
@implementation Person
// 显示信息
-(void)display{
    NSLog(@"%@养了:",self.name);
    for(id<Pet> pet in self.pets){
        NSLog(@"%@",pet.name);
    }
}
@end
