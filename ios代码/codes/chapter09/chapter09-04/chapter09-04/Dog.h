//
//  Dog.h
//  chapter09-03
//
//  Created by amaker on 4/18/13.
//  Copyright (c) 2013 amaker. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Pet.h"
// 实现Pet协议
@interface Dog : NSObject<Pet>
@property(nonatomic,strong)NSString *name;
@end
