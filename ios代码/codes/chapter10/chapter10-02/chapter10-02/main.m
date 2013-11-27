//
//  main.m
//  chapter10-02
//
//  Created by amaker on 4/18/13.
//  Copyright (c) 2013 amaker. All rights reserved.
//

#import <Foundation/Foundation.h>

// 定义一个点结构体，有两个坐标x,y
struct MyPoint{
    int x;
    int y;
};

// 定义一个矩形结构体，嵌套
struct MyRect{
    // 左定点坐标
    struct MyPoint point;
    // 宽
    int w;
    // 高
    int h;
};
// 声明一个点
struct MyPoint point;
// 声明一个矩形
struct MyRect rect;
// 测试，给结构体赋值
void testStruct(){
    point.x = 1;
    point.y = 2;
    rect.point = point;
    rect.w = 200;
    rect.h = 150;
    NSLog(@"x=%d,y=%d,w=%d,h=%d",point.x,point.y,rect.w,rect.h);
}

int main(int argc, const char * argv[])
{
    @autoreleasepool {
        testStruct();
    }
    return 0;
}

