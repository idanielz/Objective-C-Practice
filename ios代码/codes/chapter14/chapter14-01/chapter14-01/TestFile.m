//
//  TestFile.m
//  chapter14-01
//
//  Created by amaker on 3/11/13.
//  Copyright (c) 2013 amaker. All rights reserved.
//

#import "TestFile.h"

@implementation TestFile
// 获得NSFileManager实例
-(NSFileManager*)getFileManager{
    NSFileManager *fm = [NSFileManager defaultManager];
    NSLog(@"fm=%@",fm);
    return fm;
}
// 定位文件
-(void)locate{
    // 获得NSFileManager实例
    NSFileManager *fm = [NSFileManager defaultManager];
    // 获得文件路径
    NSArray *paths = [fm URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask];
    if ([paths count]>0) {
        NSURL *url = [paths objectAtIndex:0];
        NSLog(@"url=%@",url);
    }
}
// 判断文件是否存在
-(void)isExists{
    // 获得NSFileManager实例
    NSFileManager *fm = [self getFileManager];
    // 要查找的文件
    NSString *myFile = @"/tmp/Hello.txt";
    // 判断文件是否存在
    BOOL result = [fm fileExistsAtPath:myFile];
    if (result) {
        NSLog(@"%@",@"file exist!");
    }else{
        NSLog(@"%@",@"file not exist!");
    }
}
// 创建文件
-(void)createFile{
    // 获得NSFileManager实例
    NSFileManager *fm = [self getFileManager];
    // 要创建文件的路径
    NSString *myFile = @"/tmp/Hello.txt";
    // 内容
    NSString *content = @"Hello World!";
    // 创建文件
    BOOL result = [fm createFileAtPath:myFile contents:[content dataUsingEncoding:NSUTF8StringEncoding] attributes:nil];
    // 判断是否创建成功
    if (result) {
        NSLog(@"create ok");
    }else{
        NSLog(@"create error");
    }
}
// 删除文件
-(void)removeFile{
    // 获得NSFileManager实例
    NSFileManager *fm = [self getFileManager];
    // 要删除的文件路径
    NSString *myFile = @"/tmp/Hello.txt";
    // 删除文件
    BOOL result = [fm removeItemAtPath:myFile error:nil];
    // 判断是否删除成功
    if (result) {
        NSLog(@"remove ok!");
    }else{
        NSLog(@"remove error!");
    }
}
// 写文件
-(void)writeFile{
    // 要保存的文件内容
    NSString *fileContent = @"Hello World!";
    // 文件路径
    NSString *myFile = @"/tmp/Hello.txt";
    // 写文件
    BOOL result = [fileContent writeToFile:myFile atomically:YES encoding:NSUTF8StringEncoding error:nil];
    // 判断是否成功
    if (result) {
        NSLog(@"%@",@"create ok");
    }else{
        NSLog(@"%@",@"create fail");
    }
}
// 读文件
-(void)readFile{
    // 要读取的文件路径
    NSString *myFile = @"/tmp/Hello.txt";
    // 文件内容
    NSString *tempContent = [NSString stringWithContentsOfFile:myFile encoding:NSUTF8StringEncoding error:nil];
    // 输出
    NSLog(@"fileContent = %@",tempContent);
}
// 拷贝文件
-(void)copyFile{
    // 获得NSFileManager实例
    NSFileManager *fm = [self getFileManager];
    // 文件路径
    NSString *myFile = @"/tmp/Hello.txt";
    // 拷贝文件
    BOOL result = [fm copyItemAtPath:myFile toPath:@"/tmp/newFile.txt" error:nil];
    // 判断是否拷贝成功
    if (result) {
        NSLog(@"%@",@"copy ok");
    }else{
        NSLog(@"%@",@"copy fail");
    }
}
// 重命名文件
-(void)renameFile{
    // 获得NSFileManager实例
    NSFileManager *fm = [self getFileManager];
    // 文件路径
    NSString *myFile = @"/tmp/Hello.txt";
    // 重命名文件
    BOOL result = [fm moveItemAtPath:myFile toPath:@"/tmp/newFile2" error:nil];
    // 判断是否重命名成功
    if (result) {
        NSLog(@"%@",@"rename ok");
    }else{
        NSLog(@"%@",@"rename fail");
    }
}
// 获得文件属性
-(void)getFileAttributes{
    // 获得NSFileManager实例
    NSFileManager *fm = [self getFileManager];
    // 文件路径
    NSString *myFile = @"/tmp/Hello.txt";
    // 文件属性
    NSDictionary *attr = [fm attributesOfItemAtPath:myFile error:nil];
    NSLog(@"%@",attr);
    // 遍历文件属性
    for(NSString *key in attr){
        NSLog(@"%@:%@",key,[attr objectForKey:key]);
    }
}
@end
