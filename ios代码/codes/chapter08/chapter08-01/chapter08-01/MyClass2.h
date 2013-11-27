//
//  MyClass2.h
//  chapter08-01
//
//  Created by amaker on 4/17/13.
//  Copyright (c) 2013 amaker. All rights reserved.
//

#import <Foundation/Foundation.h>
// 原有方法
@interface MyClass2 : NSObject
-(void)method1;
-(void)method2;
@end
// 第一组分类
@interface MyClass2(MyCategory2)
-(void)method3;
-(void)method4;
@end
// 第二组分类
@interface MyClass2(MyCategory3)
-(void)method5;
-(void)method6;
@end
