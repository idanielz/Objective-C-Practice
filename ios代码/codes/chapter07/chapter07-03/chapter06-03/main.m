//
//  main.m
//  chapter06-03
//
//  Created by amaker on 4/16/13.
//  Copyright (c) 2013 amaker. All rights reserved.
//

#import <Foundation/Foundation.h>

int stackSize=5;
int stackArray[];
int stackTop=-1;
// 入栈/压栈
void push(int a){
    if (stackTop<stackSize-1) {
        stackArray[++stackTop]=a;
    }else{
        printf("stack full.\n");
    }
}
// 出栈
int pop(){
    int temp = stackArray[stackTop--];
    stackArray[stackTop]=0;
    return temp;
}
// 取栈顶元素
int peek(){
    return stackArray[stackTop];
}
// 是否为空
bool isEmpty(){
    return (stackTop==-1);
}
// 是否为满
bool isFull(){
    return (stackTop==stackSize-1) ;
}

void displayArray(int array[] ,int size){
    for (int i=0; i<size; i++) {
        printf("%d ",array[i]);
    }
    printf("\n");
}

void myArray(){
    // 数组大小
    int size = 10;
    // 索引
    int i;
    // 声明数组
    int array[size];
    // 给数组赋值;
    array[0]=10;
    array[1]=8;
    array[2]=9;
    array[3]=6;
    array[4]=7;
    array[5]=4;
    array[6]=3;
    array[7]=1;
    array[8]=2;
    array[9]=5;
    /*
    // 显示数组中的元素
     for (i=0; i<size; i++) {
         printf("%d ", array[i]);
     }
     printf("\n");
     
    // search
    // 要搜索的key
     int searchKey =5;
    //是否搜索到了
     BOOL isSearch = NO;
    // 循环判断
     for (i=0; i<size; i++) {
         // 如果找到
         if (array[i]==searchKey) {
             // 显示索引
             printf("%d at index %d",searchKey,i);
             isSearch = YES;
             break;
         }
     }
     if (!isSearch) {
         printf("not found!");
     }
     
    // delete
     int deleteItem = 6;
     for (i=0; i<size; i++) {
         if (array[i]==deleteItem) {
             break;
         }
     }
     for (int k = i; k<size; k++) {
         //向前覆盖
         array[k]=array[k+1];
     }
     // 大小减1
     size--;
     // 显示
     for (i = 0; i<size; i++) {
         printf("%d ",array[i]);
     }
     */
    // update
     // 要修改的元素
     int searchItem = 6;
     // 将修改成100
     int updatedItem = 100;
     // 修改前
     printf("before:");
     displayArray(array,size);
     // 查找并修改
     for (i=0; i<size; i++) {
         if (array[i]==searchItem) {
             array[i]=updatedItem;
             break;
         }
     }
     // 修改后
     printf("after:");
     displayArray(array,size);
     
}


int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        
        myArray();
        
        // insert code here...
        // NSLog(@"Hello, World!");
        
    }
    return 0;
}

