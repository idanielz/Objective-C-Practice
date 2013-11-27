//
//  MyProtocol.h
//  chapter08-02
//
//  Created by amaker on 4/17/13.
//  Copyright (c) 2013 amaker. All rights reserved.
//

#import <Foundation/Foundation.h>
@protocol MyProtocol <NSObject>
// 必须实现方法
@required
-(void)method1;
// 可选方法
@optional
-(void)method2;
@end
