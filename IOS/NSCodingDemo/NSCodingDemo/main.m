//
//  main.m
//  NSCodingDemo
//
//  Created by DanielZ on 13-12-1.
//  Copyright (c) 2013年 DanielZ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        // insert code here...
        NSString *path = @"/tmp/test.dat";
//        NSArray *array = [NSArray arrayWithObjects:@"one",@"two",@"three", nil];
//        [array writeToFile:@"/tmp/test.txt" atomically:YES];
//        NSArray *arrayTemp = [NSArray arrayWithContentsOfFile:@"/tmp/test.txt"];
//        for (NSString *str in arrayTemp) {
//            NSLog(@"%@",str);
//        }
//        NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:@"one",@"1",@"two",@"2",@"three",@"3", nil];
//        [dic writeToFile:@"/tmp/test.txt" atomically:YES];
//        NSDictionary *dic2 = [NSDictionary dictionaryWithContentsOfFile:@"/tmp/test.txt"];
//        for (NSString *key in dic2) {
//            NSLog(@"%@ %@",key,[dic2 objectForKey:key]);
//        }
//        
//        [NSKeyedArchiver archiveRootObject:dic toFile:@"/tmp/test.dat"];
//        NSDictionary *dic3 = [NSKeyedUnarchiver unarchiveObjectWithFile:@"/tmp/test.dat"];
        
        
        Person *person = [[Person alloc] init];
        [person setName:@"tom"];
        [person setAge:20];
        [NSKeyedArchiver archiveRootObject:person toFile:path];
        Person *per2 = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
        NSLog(@"name = %@, age = %d", [per2 name],[per2 age]);
    }
    return 0;
}

