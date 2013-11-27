//
//  main.m
//  chapter10-01
//
//  Created by amaker on 4/18/13.
//  Copyright (c) 2013 amaker. All rights reserved.
//

#import <Foundation/Foundation.h>
void twoDimension(){
    // 二维数组的行数
    int row = 3;
    // 二维数组的列数
    int col = 3;
    // 定义二维数组
    int table[row][col];
    // 初始化二维数组
    for (int i=0; i<row; i++) {
        for (int j=0; j<col; j++) {
            table[i][j]=i+j;
        }
    }
    // 输出
    for (int i=0; i<row; i++) {
        for (int j=0; j<col; j++) {
            NSLog(@"table[%d][%d]=%d",i,j,table[i][j]);
        }
    }
}
void loopArray(){
    // 定义数组大小
    int size = 5;
    // 根据大小定义数组
    int array[size];
    // 循环初始化数组
    for (int i=0; i<size; i++) {
        array[i]=i+1;
    }
    // 遍历数组
    for (int i=0; i<size; i++) {
        NSLog(@"array[%d]=%d",i,array[i]);
    }
}
void initArray(){
    // 定义数组并初始化，大小为5
    int array[5];
    array[0]=1;
    array[1]=2;
    array[2]=3;
    array[3]=4;
    array[4]=5;
    // 访问数组中的元素
    NSLog(@"array[0]=%d",array[0]);
    NSLog(@"array[1]=%d",array[1]);
    // 定义数组并初始化，大小为4
    int array2[] = {100,200,300,400};
    NSLog(@"array2[0]=%d",array2[0]);
}

int main(int argc, const char * argv[])
{
    @autoreleasepool {
        // initArray();
        // loopArray();
        twoDimension();
    }
    return 0;
}

