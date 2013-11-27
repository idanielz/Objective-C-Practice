//
//  main.m
//  chapter06-02
//  Created by amaker on 4/16/13.
//  Copyright (c) 2013 amaker. All rights reserved.
//

#import <Foundation/Foundation.h>
// 使用break
void test7(){
    for(int i=1; i<=10; i++){
        if(i==5)break;
        NSLog(@"i=%d",i);
    }
}
// 使用continue
void test6(){
    for(int i=1;i<=10;i++){
        if(i==4 || i==7){
            continue;
        }
        NSLog(@"i=%d",i);
    }
}
void test5(){
    // 每隔1秒输出
    int i = 1;
    while (i<10) {
        NSLog(@"i=%d",i++);
        [NSThread sleepForTimeInterval:1];
    }
}
void test4(){
    // 求和结果
    int sum = 0;
    // 计数值
    int i = 1;
    // 循环条件
    while (i<=10) {
        // 累加
        sum = sum+i;
        // 循环条件自增
        i++;
    }
    NSLog(@"sum=%d",sum);
}
void test3(){
    // 定义数组
    NSArray *array = @[@"Java",@"c++",@"c#",@"php"];
    // 增强型for循环
    for(NSString *item in array){
        // 输出
        NSLog(@"item=%@",item);
    }
}
void test2(){
    // 循环1到9
    for (int i=1; i<=9; i++) {
        // 根据外层循环来循环
        for (int j=1; j<=i; j++) {
            // 打印输出
            printf("%d*%d=%d ",j,i,i*j);
        }
        // 换行
        printf("\n");
    }
}
void test1(){
    // 定义求和结果
    int sum = 0;
    // 从1开始循环10次
    for (int i=1; i<=10; i++) {
        // 累加结果
        sum+=i;
    }
    NSLog(@"sum=%d",sum);
}
int main(int argc, const char * argv[])
{
    @autoreleasepool {
        // test1();
        // test2();
        // test3();
        // test4();
        // test5();
    }
    return 0;
}

