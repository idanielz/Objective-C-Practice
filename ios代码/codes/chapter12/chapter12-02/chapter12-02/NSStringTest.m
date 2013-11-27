//
//  NSStringTest.m
//  chapter12-02
//
//  Created by amaker on 3/7/13.
//  Copyright (c) 2013 amaker. All rights reserved.
//

#import "NSStringTest.h"

@implementation NSStringTest
-(void)testNSString{
    // 1. 求字符串长度
    NSString *str = @"Hello World!";
    NSUInteger len = [str length];
    NSLog(@"len=%lu",len);
    // 2. 获得某索引位置的字符
    char c = [str characterAtIndex:0];
    NSLog(@"c=%c",c);
    // 3. 常用初始化方法
    // 使用现有的字符串初始化
    str = [[NSString alloc]initWithString:str];
    NSLog(@"str=%@",str);
    str = [NSString stringWithString:str];
    NSLog(@"str=%@",str);
    // 使用c字符串初始化
    str = [NSString stringWithUTF8String:"c string!"];
    NSLog(@"str=%@",str);
    // 格式化字符串
    NSString *name = @"tom";
    int age = 30;
    NSString *msg = [[NSString alloc]initWithFormat:@"%@,%d",name,age];
    NSLog(@"%@",msg);
    msg = [NSString stringWithFormat:@"%@,%d",name,age];
    NSLog(@"%@",msg);
    // 4. NSData 和字符串之间的转换
    NSData *data = [str dataUsingEncoding:NSUTF8StringEncoding];
    str = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
    NSLog(@"%@",str);
    // 5. 读写文件
    NSString *filePath = @"/tmp/test.txt";
    NSString *content = @"file content";
    [content writeToFile:filePath atomically:YES encoding:NSUTF8StringEncoding error:nil];
    content = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil];
    NSLog(@"str=%@",content);
    // 6. 取子字符串
    str = @"Hello World!";
    // 从某个索引开始
    NSString *subString = [str substringFromIndex:2];
    NSLog(@"subString=%@",subString);
    // 到某个索引
    subString = [str substringToIndex:5];
    NSLog(@"subString=%@",subString);
    // 取某个范围
    NSRange range = NSMakeRange(2, 3);
    subString = [str substringWithRange:range];
    NSLog(@"subString=%@",subString);
    // 7. 字符串和数字类型的转换
    str = @"123";
    int i = [str intValue];
    NSLog(@"i=%d",i);
    str = @"3.14";
    float f = [str floatValue];
    NSLog(@"f=%f",f);
    // 8. 和文件路径相关的方法
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *path = [paths objectAtIndex:0];
    NSLog(@"path=%@",path);
    path = [path stringByAppendingPathComponent:@"test.txt"];
    NSLog(@"path=%@",path);
    // 9. 转换大小写
    str = @"hello world!";
    // 大写
    str = [str uppercaseString];
    NSLog(@"str = %@",str);
    // 首字母大写
    str = [str capitalizedString];
    NSLog(@"str = %@",str);
    // 小写
    str = [str lowercaseString];
    NSLog(@"str = %@",str);
    // 10. 字符串比较
    NSString *str1 = @"abcd";
    NSString *str2 = @"abce";
    NSComparisonResult result = [str1 compare:str2];
    if (result==NSOrderedAscending) {
        NSLog(@"str1<str2");
    }else if(result==NSOrderedDescending){
        NSLog(@"str1>str2");
    }else{
         NSLog(@"str1==str2");
    }
    // 11. 是否有前后缀
    str = @"main.m";
    if ([str hasSuffix:@".m"]) {
        NSLog(@"has .m");
    }else{
        NSLog(@"has not .m");
    }
}
-(void)testNSMutableString{
    // 初始化方法
    NSMutableString *str = [NSMutableString stringWithCapacity:20];
    // 添加字符串
    [str appendString:@"Hello world!"];
    NSLog(@"str=%@",str);
    // 删除字符串
    NSRange range = NSMakeRange(0, 5);
    [str deleteCharactersInRange:range];
    NSLog(@"str=%@",str);
    // 插入字符串
    str = [NSMutableString stringWithCapacity:20];
    [str appendString:@"Hello World!"];
    [str insertString:@" Temp " atIndex:5];
    NSLog(@"str=%@",str);
    // 替换字符串
    [str replaceCharactersInRange:NSMakeRange(5, 7) withString:@" new "];
    NSLog(@"str=%@",str);
    // 重置字符串
    [str setString:@"set new string"];
    NSLog(@"str=%@",str);
}
@end
