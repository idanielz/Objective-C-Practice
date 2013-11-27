//
//  main.m
//  chapter14-01
//
//  Created by amaker on 3/11/13.
//  Copyright (c) 2013 amaker. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TestFile.h"
int main(int argc, const char * argv[])
{

    @autoreleasepool {
       
        TestFile *tf = [[TestFile alloc]init];
        [tf locate];
        // 获得NSFileManager
        // NSFileManager *fm = [tf getFileManager];
        // 判断文件是否存在
        // [tf isExists];
        // 创建文件
        // [tf createFile];
        // 删除文件
        // [tf removeFile];
        // 写文件
        // [tf writeFile];
        
        // 读文件
        // [tf readFile];
        
        // 拷贝文件
        // [tf copyFile];
        // 重命名文件
        // [tf renameFile];
        // 获得文件属性
        // [tf getFileAttributes];
        
    }
    return 0;
}

