//
//  NSNumberTest.m
//  chapter12-01
//
//  Created by amaker on 3/7/13.
//  Copyright (c) 2013 amaker. All rights reserved.
//

#import "NSNumberTest.h"

@implementation NSNumberTest
// NSNumber和基本类型之间相互转换
-(void)convert1{
    // 1. 使用静态方法创建NSNumber对象,该过程是将基本数值类型转换为NSNumber类型
    // 布尔类型BOOL
    BOOL b = YES;
    NSNumber *myBoolNumber = [NSNumber numberWithBool:b];
    // 字符类型char
    char c = 'A';
    NSNumber *myCharNumber = [NSNumber numberWithChar:c];
    // 双精度类型
    double d = 3.1415;
    NSNumber *myDoubleNumber = [NSNumber numberWithDouble:d];
    // 单精度
    float f = 3.14;
    NSNumber *myFloatNumber = [NSNumber numberWithFloat:f];
    // 整型
    int i = 100;
    NSNumber *myIntNumber = [NSNumber numberWithInt:i];
    // NSInteger
    NSInteger integer = 100;
    NSNumber *myIntegerNumber = [NSNumber numberWithInteger:integer];
    // 长整型
    long int l = 123456;
    NSNumber *myLongNumber = [NSNumber numberWithLong:l];
    // long long 类型
    long long int lli = 12345678;
    NSNumber *myLongLongNumber = [NSNumber numberWithLongLong:lli];
    // 短整型
    short int si = 1;
    NSNumber *myShortNumber = [NSNumber numberWithShort:si];
    // 无符号char
    unsigned char uc = 'x';
    NSNumber *myUnsignedChar = [NSNumber numberWithUnsignedChar:uc];
    // 无符号整型
    unsigned int ui = 135;
    NSNumber *myUnsignedInt = [NSNumber numberWithUnsignedInt:ui];
    // NSUInteger
    NSUInteger ui2 = 123;
    NSNumber *myNSUInteger = [NSNumber numberWithUnsignedInteger:ui2];
    // unsigned long int
    unsigned long int uli = 123;
    NSNumber *myUnsignedLongInt = [NSNumber numberWithUnsignedLong:uli];
    // unsigned long long int
    unsigned long long int ulli = 123;
    NSNumber *myUnsignedLongLongInt = [NSNumber numberWithUnsignedLongLong:ulli];
    // unsigned short
    unsigned short int usi = 1;
    NSNumber *myUnsignedShortInt = [NSNumber numberWithUnsignedShort:usi];
    
    
    // 2. 将NSNumber转换为基本整型
    // BOOL
    b = [myBoolNumber boolValue];
    NSLog(@"b=%d",b);
    // char
    c = [myCharNumber charValue];
    NSLog(@"c=%c",c);
    // double
    d = [myDoubleNumber doubleValue];
    NSLog(@"d=%f",d);
    // float
    f = [myFloatNumber floatValue];
    NSLog(@"d=%f",f);
    // int
    i = [myIntNumber intValue];
    NSLog(@"i=%d",i);
    // NSInteger
    integer = [myIntegerNumber integerValue];
    NSLog(@"integer=%ld",integer);
    // long
    l = [myLongNumber longValue];
    NSLog(@"l=%ld",l);
    // long long
    lli = [myLongLongNumber longLongValue];
    NSLog(@"lli=%lli",lli);
    // short int
    si = [myShortNumber shortValue];
    NSLog(@"si=%d",si);
    // unsigned char
    uc = [myUnsignedChar unsignedCharValue];
    NSLog(@"uc=%c",uc);
    // unsigned int
    ui = [myUnsignedInt unsignedIntValue];
    NSLog(@"ui=%ud",ui);
    // NSUInteger
    ui2 = [myNSUInteger unsignedIntegerValue];
    NSLog(@"ui2=%lu",(unsigned long)ui2);
    // unsigned long int
    uli = [myUnsignedLongInt unsignedLongValue];
    NSLog(@"uli=%lu",uli);
    // unsigned long long int
    ulli = [myUnsignedLongLongInt unsignedLongLongValue];
    NSLog(@"ulli=%llu",ulli);
    // unsigned short
    usi = [myUnsignedShortInt unsignedShortValue];
    NSLog(@"usi=%u",usi);
}
// 将NSNumber对象转换为字符串
-(void)convert2{
    // 将NSNumber对象转换为字符串
    NSNumber *n = [NSNumber numberWithDouble:3.14];
    NSString *s = [n stringValue];
    NSLog(@"s=%@",s);
    // 将字符串转换为基本类型
    NSString *snumber = @"100";
    int num = [snumber intValue];
    NSLog(@"num=%d",num);
}
// 比较两个NSNumber的大小
-(void)compare{
    NSNumber *num1 = [NSNumber numberWithInt:200];
    NSNumber *num2 = [NSNumber numberWithInt:200];
    // 比较
    NSComparisonResult result = [num1 compare:num2];
    // 判断大小
    if (result==NSOrderedAscending) {
        NSLog(@"num1<num2");
    }else if(result==NSOrderedDescending){
         NSLog(@"num1>num2");
    }else{
        NSLog(@"num1==num2");
    }
}
@end
