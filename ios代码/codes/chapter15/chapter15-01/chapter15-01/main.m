//
//  main.m
//  chapter15-01
//
//  Created by amaker on 3/11/13.
//  Copyright (c) 2013 amaker. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TestCopy.h"

/**************** 本节内容提要 *****************/
// 1. 理解赋值和拷贝的区别
// 2. 理解深复制和浅复制
// 3. 自定义类如何实现Copying协议
// 4. 对象属性中的copy

/*
例如：@property (nonatomic,copy) NSString *name;
-(void)setName:(NSString *)name1{
    name = [name1 copy];
}

// 1. 理解赋值和拷贝的区别
NSMutableArray *array1 = [NSMutableArray arrayWithObjects:@"1",@"2",@"3", nil];
// 赋值
NSMutableArray *array2 = array1;

[array2 removeObjectAtIndex:0];

for(NSString *item in array1){
    NSLog(@"%@",item);
}

NSLog(@"%@",@"------------------");

for(NSString *item in array2){
    NSLog(@"%@",item);
}


// 拷贝
NSMutableArray *array2 = [array1 mutableCopy];

[array2 removeObjectAtIndex:0];

for(NSString *item in array1){
    NSLog(@"%@",item);
}

NSLog(@"%@",@"------------------");

for(NSString *item in array2){
    NSLog(@"%@",item);
}



// 2. 理解深复制和浅复制

NSMutableArray *array1 = [NSMutableArray arrayWithObjects:[NSMutableString stringWithString:@"1"],[NSMutableString stringWithString:@"2"],[NSMutableString stringWithString:@"3"], nil];
// 浅复制
// NSMutableArray *array2 = [array1 mutableCopy];


// 深复制

NSMutableArray *array2 = [NSMutableArray arrayWithCapacity:3];

for(NSString *str2 in array1){
    [array2 addObject:[str2 mutableCopy]];
}

//[array2 removeObjectAtIndex:0];


NSMutableString *str = [array1 objectAtIndex:0];
[str appendString:@"changed"];

for(NSString *item in array1){
    NSLog(@"%@",item);
}

NSLog(@"%@",@"------------------");

for(NSString *item in array2){
    NSLog(@"%@",item);
}


// 3. 自定义类如何实现Copying协议
Person *per = [[Person alloc]init];
// 如果没有实现Copying协议会出现错误
//Person *per2 = [per copy];

Person *per2 = [per copy];

*/

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        TestCopy *tc = [[TestCopy alloc]init];
        // [tc testAssign];
        // [tc testAssign2];
        // [tc testCopy];
        [tc testDeepCopy];
    }
    return 0;
}

