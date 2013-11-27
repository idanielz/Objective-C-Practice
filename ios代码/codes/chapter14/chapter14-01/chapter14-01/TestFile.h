//
//  TestFile.h
//  chapter14-01
//
//  Created by amaker on 3/11/13.
//  Copyright (c) 2013 amaker. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TestFile : NSObject

// 获得NSFileManager实例
-(NSFileManager*)getFileManager;
// 定位文件
-(void)locate;
// 判断文件是否存在
-(void)isExists;
// 创建文件
-(void)createFile;
// 删除文件
-(void)removeFile;
// 写文件
-(void)writeFile;
// 读文件
-(void)readFile;
// 拷贝文件
-(void)copyFile;
// 重命名文件
-(void)renameFile;
// 获得文件属性
-(void)getFileAttributes;

@end
