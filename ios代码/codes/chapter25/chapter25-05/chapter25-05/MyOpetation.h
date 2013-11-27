//
//  MyOpetation.h
//  chapter25-05
//
//  Created by amaker on 4/22/13.
//  Copyright (c) 2013 amaker. All rights reserved.
//

#import <Foundation/Foundation.h>
// 自定义一个操作类，继承NSOperation
@interface MyOpetation : NSOperation
// 操作名称属性
@property(nonatomic,strong)NSString *name;
// 初始化方法
-(id)initWithName:(NSString*)name;
@end
