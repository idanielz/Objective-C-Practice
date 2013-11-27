//
//  IBM.h
//  chapter08-02
//
//  Created by amaker on 4/17/13.
//  Copyright (c) 2013 amaker. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IBMDelegate.h"
// 实现代理协议
@interface IBM : NSObject<IBMDelegate>
// 生产电脑方法
-(void)produce;
// 代理属性
@property(nonatomic,strong)id<IBMDelegate> delegate;
@end
