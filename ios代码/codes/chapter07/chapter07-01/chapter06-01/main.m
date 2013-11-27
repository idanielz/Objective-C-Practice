//
//  main.m
//  chapter06-01
//
//  Created by amaker on 4/16/13.
//  Copyright (c) 2013 amaker. All rights reserved.
//

#import <Foundation/Foundation.h>
#define UP 1
#define DOWN 2
#define LEFT 3
#define RIGHT 4
void test3(){
    // 声明两个整数
    int a = 1,b = 2;
    // 使用三元运算判断两个数的大小
    int max = a>b?a:b;
    // 输出比较结果
    NSLog(@"a=%d,b=%d,max=%d",a,b,max);
    // 声明三个数字
    int x = 50,y = 70,z = 30;
    // 通过嵌套三元运算比较三个数的大小
    max = x>y?(x>z?x:z):(y>z?y:z);
    // 输出比较结果
    NSLog(@"x=%d,y=%d,z=%d,max=%d",x,y,z,max);
}
void test2(){
    // 随机生产1到4之间的方向值
    int direction = arc4random()%4+1;
    // 输出当前方向
    NSLog(@"direction=%d",direction);
    // 通过switch判断当前方向
    switch (direction) {
        case UP:
            NSLog(@"Move UP");
            break;
        case DOWN:
            NSLog(@"Move DOWN");
            break;
        case LEFT:
            NSLog(@"Move LEFT");
            break;
        case RIGHT:
            NSLog(@"Move RIGHT");
            break;
        default:
            NSLog(@"ERROR...");
            break;
    }
}
void test1(){
    // 使用arc4random函数随机生成0到100之间的随机数
    int i = arc4random()%100;
    int j = arc4random()%100;
    // 输出当前随机数
    NSLog(@"i=%d",i);
    NSLog(@"j=%d",j);
    // 判断大小
    if (i>j) {
        NSLog(@"i>j");
    }else if(i==j){
        NSLog(@"i==j");
    }else{
        NSLog(@"i<j");
    }
}

int main(int argc, const char * argv[])
{
    @autoreleasepool {
        // 测试if else
        // test1();
        // test2();
        test3();
    }
    return 0;
}

