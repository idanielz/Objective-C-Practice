//
//  CollecitonTest.m
//  chapter13-01
//
//  Created by amaker on 3/7/13.
//  Copyright (c) 2013 amaker. All rights reserved.
//

#import "CollecitonTest.h"
@implementation CollecitonTest
-(void)testNSArray{
    // 直接赋值初始化
    NSArray *array = @[@"A",@"B",@"C"];
    // 使用已经存在的数组进行初始化
    NSArray *array2 = [NSArray arrayWithArray:array];
    // 使用对象集合进行初始化
    NSArray *array3 = [NSArray arrayWithObjects:@"A",@"B",@"C", nil];
    
    // 获得某个索引位置的元素
    NSString *obj = [array objectAtIndex:0];
    NSLog(@"obj=%@",obj);
    // 判断是否包含某个元素
    BOOL result = [array containsObject:@"B"];
    if (result) {
        NSLog(@"contains");
    }else{
        NSLog(@"not contains");
    }
    // 获得数组大小
    NSUInteger count = [array count];
    NSLog(@"count=%lu",count);
    // 遍历数组
    for (int i=0; i<count; i++) {
        NSString *obj = [array objectAtIndex:i];
        NSLog(@"obj=%@",obj);
    }
    // 遍历数组
    for(NSString *str in array){
        NSLog(@"str=%@",str);
    }
    // 排序
    array = [array sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2) {
        return obj1<obj2;
    }];
    NSLog(@"%@",array);
}
-(void)testMutableNSArray{
    // 初始化
    NSMutableArray *mArray = [NSMutableArray arrayWithCapacity:20];
    // 添加
    [mArray addObject:@"A"];
    [mArray addObject:@"B"];
    [mArray addObject:@"C"];
    for(NSString *str in mArray){
        NSLog(@"str=%@",str);
    }
    // 删除
    [mArray removeObjectAtIndex:1];
    // 删除所有
    //[mArray removeAllObjects];
    // 删除最后一个
    //[mArray removeLastObject];
    // 替换
    [mArray setObject:@"new object" atIndexedSubscript:1];
    [mArray replaceObjectAtIndex:1 withObject:@"new object2"];
    NSLog(@"%@",mArray);
}

-(void)testNSSet{
    // 使用数组初始化
    NSArray *array = @[@"A",@"B",@"C"];
    NSSet *set = [NSSet setWithArray:array];
    NSLog(@"set=%@",set);
    // 使用存在的数组初始化
    NSSet *set1 = [[NSSet alloc]initWithSet:set];
    // 使用一组对象
    NSSet *set2 = [NSSet setWithObjects:@"item1",@"item2",@"item3",nil];
    
    // 个数
    NSUInteger count = [set count];
    NSLog(@"count=%lu",count);
    // 遍历
    for(NSString *item in set){
        NSLog(@"item=%@",item);
    }
    
    // 获得任意一个对象
    NSString *anyObj = [set anyObject];
    NSLog(@"anyObj=%@",anyObj);
    
    // 判断是否包含某个对象
    BOOL result = [set containsObject:@"A"];
    if (result) {
        NSLog(@"contains");
    }else{
        NSLog(@"not contains");
    }
    // 判断是否是某个集合的子集
    NSSet *set11 = [NSSet setWithObjects:@"A",@"B",@"C",@"C", nil];
    NSSet *set12 = [NSSet setWithObjects:@"B",@"C", nil];
    result = [set12 isSubsetOfSet:set11];
    if (result) {
        NSLog(@"set2 is subset of set1");
    }else{
        NSLog(@"set2 is not subset of set1");
    }
    // 判断是否是交集
    result = [set12 intersectsSet:set11];
    if (result) {
        NSLog(@"set12 is intersects of set11");
    }else{
        NSLog(@"set12 is not intersects of set11");
    }
}
-(void)testNSMutableSet{
    // 初始化
    NSMutableSet *mSet = [NSMutableSet setWithCapacity:5];
    // 添加对象
    [mSet addObject:@"A"];
    [mSet addObject:@"B"];
    [mSet addObject:@"C"];
    [mSet addObject:@"C"];
    NSLog(@"mSet=%@",mSet);
    // 删除对象
    [mSet removeObject:@"B"];
    NSLog(@"mSet=%@",mSet);
    // 删除所有元素
    // [mSet removeAllObjects];
    
    // 求子、交、并集
    NSMutableSet *set1 = [NSMutableSet setWithCapacity:5];
    [set1 addObject:@"A"];
    [set1 addObject:@"B"];
    [set1 addObject:@"C"];
    
    NSMutableSet *set2 = [NSMutableSet setWithCapacity:5];
    [set2 addObject:@"B"];
    [set2 addObject:@"C"];
    [set2 addObject:@"D"];
    // 并集
    //[set1 unionSet:set2];
    NSLog(@"set1=%@",set1);
    // 交集
    //[set1 intersectSet:set2];
    NSLog(@"set1=%@",set1);
    // set1 减 set2
    [set1 minusSet:set2];
    NSLog(@"set1=%@",set1);
}

-(void)testNSDictionary{
    // 初始化1
    NSDictionary *dic1 = @{@"first name": @"guo",@"last name": @"hongzhi",@"age":@"30"};
    // 根据key获得value
    NSLog(@"First name=%@",dic1[@"first name"]);
    NSLog(@"Last name=%@",dic1[@"last name"]);
    NSLog(@"Age=%@",dic1[@"age"]);
    
    // 初始化2
    NSArray *keys = @[@"k1",@"k2",@"k3"];
    NSArray *values = @[@"v1",@"v2",@"v3"];
    NSDictionary *dic2 = [NSDictionary dictionaryWithObjects:values forKeys:keys];
    
    // 根据key获得value2
    NSString *v1 = [dic2 objectForKey:@"k1"];
    NSLog(@"%@",v1);
    
    // 计数
    NSUInteger count = [dic2 count];
    NSLog(@"count=%lu",count);
    
    // 遍历
    for(NSString *key in dic2){
        NSString *value = [dic2 objectForKey:key];
        NSLog(@"%@,%@",key,value);
    }
    // 获得所有keys
    NSArray *allKeys = [dic2 allKeys];
    for(NSString *key in allKeys){
        NSLog(@"%@",key);
    }
    // 所有values
    NSArray *allValues = [dic2 allValues];
    for(NSString *value in allValues){
        NSLog(@"%@",value);
    }
}
-(void)testMutableNSDictionary{
    // 初始化
    NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithCapacity:2];
    // 添加
    [dic setObject:@"value1" forKey:@"key1"];
    [dic setObject:@"value2" forKey:@"key2"];
    [dic setObject:@"value3" forKey:@"key3"];
    [dic setObject:@"value4" forKey:@"key4"];
    
    for(NSString *key in dic){
        NSString *value = [dic objectForKey:key];
        NSLog(@"%@,%@",key,value);
    }
    // 删除
    [dic removeObjectForKey:@"key1"];
    NSLog(@"-------------");
    for(NSString *key in dic){
        NSString *value = [dic objectForKey:key];
        NSLog(@"%@,%@",key,value);
    }
    // 删除所有对象
    [dic removeAllObjects];
}

@end
