//
//  TestCopy.h
//  chapter15-01
//
//  Created by amaker on 4/13/13.
//  Copyright (c) 2013 amaker. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TestCopy : NSObject
// 测试赋值
-(void)testAssign;
// 测试赋值
-(void)testAssign2;
// 测试拷贝
-(void)testCopy;
// 测试深拷贝
-(void)testDeepCopy;
// 测试自定义拷贝
-(void)testCustomCopy;
@end
