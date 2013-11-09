//
//  main.c
//  Addresses
//
//  Created by DanielZ on 13-10-29.
//  Copyright (c) 2013年 DanielZ. All rights reserved.
//

#include <stdio.h>

int main(int argc, const char * argv[])
{

    // insert code here...
    int i = 10;
    int *ptr = &i;
    printf("i stores its value at %p\n", &i);
    printf("ptr stores address %p\n", ptr);
    *ptr = 16;
    printf("now ptr stores number %d\n", i);
    printf("this function starts at %p\n", main);
    printf("pointer is %zu bytes\n", sizeof(int *)); //4是32位系统 8是64位
    printf("int is %zu bytes\n", sizeof(int));
    printf("float is %zu bytes\n", sizeof(float));
    printf("short is %zu bytes\n", sizeof(short));
    int *newpoint = NULL;
    newpoint = ptr;
    if (newpoint){
        printf("not null\n");
        printf("%d\n", *newpoint);
    }
    else
        printf("null\n");

    return 0;
}

