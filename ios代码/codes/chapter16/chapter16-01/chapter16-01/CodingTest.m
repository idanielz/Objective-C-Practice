//
//  CodingTest.m
//  chapter16-01
//
//  Created by amaker on 4/15/13.
//  Copyright (c) 2013 amaker. All rights reserved.
//

#import "CodingTest.h"
#import "Person.h"
@implementation CodingTest

-(void)writeString{
    // 声明字符串
    NSString *str = @"Hello World!";
    // 将字符串内容，写到tmp目录下的abc.txt文件中
    [str writeToFile:@"/tmp/abc.txt" atomically:YES encoding:NSUTF8StringEncoding error:nil];
}

-(void)readString{
    // 获得tmp目录下，abc.txt中的内容
    NSString *str = [NSString stringWithContentsOfFile:@"/tmp/abc.txt" encoding:NSUTF8StringEncoding error:nil];
    NSLog(@"%@",str);
}

-(void)writeArray{
    // 声明数组
    NSArray *array = [NSArray arrayWithObjects:@"one",@"two", nil];
    // 将数组内容，写到tmp目录下的abc02.txt文件中
    [array writeToFile:@"/tmp/abc02.txt" atomically:TRUE];
}
-(void)readArray{
    // 读tmp目录下的abc02.txt文件中的内容
    NSArray *array = [NSArray arrayWithContentsOfFile:@"/tmp/abc02.txt"];
    // 遍历数组内容
    for(NSString *item in array){
        NSLog(@"item=%@",item);
    }
}

-(void)writeDictionary{
    // 声明字典
    NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:@"tom",@"1",@"kite",@"2",@"rose",@"3", nil];
    // 将字典内容写到tmp目录下的def.txt文件中
    [dic writeToFile:@"/tmp/def.txt" atomically:TRUE];
}
-(void)readDictionary{
    // 读取tmp目录下的def.txt文件中的内容
    NSDictionary *dic = [NSDictionary dictionaryWithContentsOfFile:@"/tmp/def.txt"];
    // 遍历字典
    for(NSString *key in dic){
        NSLog(@"[%@,%@]",key,[dic objectForKey:key]);
    }
}
-(void)archive{
    // 声明一个字典
    NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:@"tom",@"1",@"kite",@"2",@"rose",@"3", nil];
    // 归档字典到tmp目录下的test.archive文件中
    [NSKeyedArchiver archiveRootObject:dic toFile:@"/tmp/test.archive"];
}
-(void)unarchive{
    // 声明一个字典
    NSDictionary *dic2 = [NSKeyedUnarchiver unarchiveObjectWithFile:@"/tmp/test.archive"];
    // 解归档
    for(NSString *key in dic2){
        NSLog(@"%@:%@",key,[dic2 objectForKey:key]);
    }
}

-(void)custom{
    // 实例化Person
    Person *per = [[Person alloc]init];
    // 设置属性
    [per setAge:20];
    [per setName:@"tom"];
    // 归档Person
    [NSKeyedArchiver archiveRootObject:per toFile:@"/tmp/person.archive"];
    // 反归档Person
    Person *per2 = [NSKeyedUnarchiver unarchiveObjectWithFile:@"/tmp/person.archive"];
    // 输出person属性
    NSLog(@"name=%@,age=%d",[per2 name],[per2 age]);
}

-(void)deepCopy{
    // 声明可变数组
    NSMutableArray *array = [NSMutableArray arrayWithObjects:[NSMutableString stringWithString:@"one"],[NSMutableString stringWithString:@"two"], nil];
    // 将数组转换为NSData
    NSData *buffer;
    buffer = [NSKeyedArchiver archivedDataWithRootObject:array];
    // 反归档
    NSMutableArray *array2 = [NSKeyedUnarchiver unarchiveObjectWithData:buffer];
    
    // 测试结果
    NSMutableString *element = [array2 objectAtIndex:0];
    [element appendString:@" changed"];
    
    for(NSString *item in array){
        NSLog(@"%@",item);
    }
    
    for(NSString *item in array2){
        NSLog(@"%@",item);
    }
}

@end
