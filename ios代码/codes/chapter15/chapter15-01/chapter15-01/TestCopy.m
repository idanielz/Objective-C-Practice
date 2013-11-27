//
//  TestCopy.m
//  chapter15-01
//
//  Created by amaker on 4/13/13.
//  Copyright (c) 2013 amaker. All rights reserved.
//

#import "TestCopy.h"
#import "Person.h"

@implementation TestCopy
// 测试赋值
-(void)testAssign{
    // 实例化Person
    Person *per1 = [[Person alloc]init];
    // 给第一个对象属性赋值
    per1.age = 20;
    per1.name = @"tom";
    // 将第一个对象引用赋值给第二个对象
    Person *per2 = per1;
    per1.name = @"big tom";
    per1.age = 21;
    
    NSLog(@"per1's name=%@,age=%d",per1.name,per1.age);
    NSLog(@"per2's name=%@,age=%d",per2.name,per2.age);
}

// 测试赋值2
-(void)testAssign2{
    // 初始化数组
    NSMutableArray *array1 = [NSMutableArray arrayWithObjects:@"1",@"2",@"3", nil];
    // 赋值
    NSMutableArray *array2 = array1;
    // 删除第二个数组中的元素
    [array2 removeObjectAtIndex:0];
    
    // 遍历第一个数组
    for(NSString *item in array1){
        NSLog(@"%@",item);
    }
    
    NSLog(@"%@",@"------------------");
    // 遍历第二个数组
    for(NSString *item in array2){
        NSLog(@"%@",item);
    }
}
// 测试拷贝
-(void)testCopy{
    // 初始化数组
    NSMutableArray *array1 = [NSMutableArray arrayWithObjects:@"1",@"2",@"3", nil];
    // 拷贝数组
    NSMutableArray *array2 = [array1 mutableCopy];
    // 删除第二个数组中的元素
    [array2 removeObjectAtIndex:0];
    
    // 遍历第一个数组中的元素
    for(NSString *item in array1){
        NSLog(@"%@",item);
    }
    
    NSLog(@"%@",@"------------------");
    // 遍历第二个数组中的元素
    for(NSString *item in array2){
        NSLog(@"%@",item);
    }
}
// 测试深拷贝
-(void)testDeepCopy{
    NSMutableArray *array1 = [NSMutableArray arrayWithObjects:[NSMutableString stringWithString:@"1"],[NSMutableString stringWithString:@"2"],[NSMutableString stringWithString:@"3"], nil];
    // 浅复制
    // NSMutableArray *array2 = [array1 mutableCopy];
    
    // 深复制
    
    NSMutableArray *array2 = [NSMutableArray arrayWithCapacity:3];
    // 赋值数组中的每一个元素
    for(NSString *str2 in array1){
        [array2 addObject:[str2 mutableCopy]];
    }
    
    // 改变第一个数组中的元素
    NSMutableString *str = [array1 objectAtIndex:0];
    [str appendString:@"changed"];
    // 遍历改变后第一个数组中的内容
    for(NSString *item in array1){
        NSLog(@"%@",item);
    }
    
    NSLog(@"%@",@"------------------");
    // 遍历改变后第二个数组中的内容
    for(NSString *item in array2){
        NSLog(@"%@",item);
    }

}
// 测试自定义拷贝
-(void)testCustomCopy{
    // 自定义类如何实现Copying协议
    Person *per = [[Person alloc]init];
    // 如果没有实现Copying协议会出现错误
    Person *per2 = [per copy];
}
@end
