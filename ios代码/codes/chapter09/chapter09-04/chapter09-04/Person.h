//
//  Person.h
//  chapter09-03
//
//  Created by amaker on 4/18/13.
//  Copyright (c) 2013 amaker. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Pet.h"

@interface Person : NSObject
// 姓名
@property(nonatomic,strong)NSString *name;
// 宠物集合数组
@property(nonatomic,strong)NSMutableArray *pets;
-(void)display;
@end
