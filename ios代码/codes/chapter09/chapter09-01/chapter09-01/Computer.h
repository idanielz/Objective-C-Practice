//
//  Computer.h
//  chapter09-01
//
//  Created by amaker on 4/17/13.
//  Copyright (c) 2013 amaker. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CPU.h"
#import "ROM.h"
@interface Computer : NSObject
// 电脑名称
@property(nonatomic,strong)NSString *name;
// 关联CPU
@property(nonatomic,strong)CPU *cpu;
// 关联ROM
@property(nonatomic,strong)ROM *rom;
-(void)displayMsg;
@end
