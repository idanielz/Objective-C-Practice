//
//  main.m
//  chapter16-01
//
//  Created by amaker on 3/11/13.
//  Copyright (c) 2013 amaker. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CodingTest.h"

/*
 
 // 1. 使用属性列表plists 保存数据
 // 2. 使用NSKeyedArchiver
 // 3. 归档自定义类型
 // 4. 利用归档实现深复制
 
 // 1. 使用属性列表归档
 // 适用类型 NSArray NSString NSDictionary NSData NSNumber
 
 // 方法：
 // 写方法 writeToFile
 // 读方法 xxxWithContentsOfFile
 
 // 1.1 字符串
 
 NSString *str = @"Hello World!";
 [str writeToFile:@"/tmp/abc.txt" atomically:YES encoding:NSUTF8StringEncoding error:nil];
 
 str = [NSString stringWithContentsOfFile:@"/tmp/abc.txt" encoding:NSUTF8StringEncoding error:nil];
 NSLog(@"%@",str);
 // 1.2. 字典
 NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:@"tom",@"1",@"kite",@"2",@"rose",@"3", nil];
 
 [dic writeToFile:@"/tmp/def.txt" atomically:TRUE];
 
 
 // 1.3. 数组
 NSArray *array = [NSArray arrayWithObjects:@"one",@"two", nil];
 [array writeToFile:@"/tmp/abc02.txt" atomically:TRUE];
 
 
 // 2 NSKeyedArchiver
 
 NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:@"tom",@"1",@"kite",@"2",@"rose",@"3", nil];
 // 归档
 [NSKeyedArchiver archiveRootObject:dic toFile:@"/tmp/test.archive"];
 
 NSDictionary *dic2 = [NSKeyedUnarchiver unarchiveObjectWithFile:@"/tmp/test.archive"];
 // 解归档
 for(NSString *key in dic2){
 NSLog(@"%@:%@",key,[dic2 objectForKey:key]);
 }
 
 // 归档 自定义类型
 Person *per = [[Person alloc]init];
 [per setAge:20];
 [per setName:@"tom"];
 [NSKeyedArchiver archiveRootObject:per toFile:@"/tmp/person.archive"];
 
 Person *per2 = [NSKeyedUnarchiver unarchiveObjectWithFile:@"/tmp/person.archive"];
 
 NSLog(@"name=%@,age=%d",[per2 name],[per2 age]);
 
 
 
 // 4. 利用归档实现深复制
 
 NSMutableArray *array = [NSMutableArray arrayWithObjects:[NSMutableString stringWithString:@"one"],[NSMutableString stringWithString:@"two"], nil];
 
 NSData *buffer;
 buffer = [NSKeyedArchiver archivedDataWithRootObject:array];
 
 NSMutableArray *array2 = [NSKeyedUnarchiver unarchiveObjectWithData:buffer];
 
 NSMutableString *element = [array2 objectAtIndex:0];
 
 [element appendString:@" changed"];
 
 for(NSString *item in array){
 NSLog(@"%@",item);
 }
 
 for(NSString *item in array2){
 NSLog(@"%@",item);
 }
 
*/

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        CodingTest *ct = [[CodingTest alloc]init];
       // [ct writeString];
       // [ct readString];
       // [ct writeArray];
       // [ct readArray];
       // [ct writeDictionary];
       // [ct readDictionary];
        
        // [ct archive];
        // [ct unarchive];
        [ct custom];
        
    }
    return 0;
}

