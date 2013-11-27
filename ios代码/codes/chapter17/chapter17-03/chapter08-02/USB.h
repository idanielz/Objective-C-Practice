//
//  USB.h
//  chapter08-02
//
//  Created by amaker on 4/17/13.
//  Copyright (c) 2013 amaker. All rights reserved.
//

#import <Foundation/Foundation.h>
// usb协议
@protocol USB <NSObject>
// 读数据方法
-(void)read;
// 协议数据方法
-(void)write;
@end
