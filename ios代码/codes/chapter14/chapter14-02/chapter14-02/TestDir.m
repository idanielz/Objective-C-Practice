//
//  TestDir.m
//  chapter14-02
//
//  Created by amaker on 3/11/13.
//  Copyright (c) 2013 amaker. All rights reserved.
//

#import "TestDir.h"

@implementation TestDir

// 创建目录
-(void)createDir{
    // 实例化NSFileManager
    NSFileManager *fm = [NSFileManager defaultManager];
    // 创建目录
    BOOL result = [fm createDirectoryAtPath:@"/tmp/guohz/" withIntermediateDirectories:YES attributes:nil error:nil];
    // 判断结果
    if (result) {
        NSLog(@"%@",@"create ok.");
    }else{
        NSLog(@"%@",@"create fail.");
    }
}
// 删除目录
-(void)removeDir{
    // 实例化NSFileManager
    NSFileManager *fm = [NSFileManager defaultManager];
    // 删除目录
    BOOL result = [fm removeItemAtPath:@"/tmp/ghz" error:nil];
    // 判断结果
    if (result) {
        NSLog(@"%@",@"remove ok！");
    }else{
        NSLog(@"%@",@"remove fail！");
    }
}
// 获得当前路径
-(void)getCurrentDir{
    // 实例化NSFileManager
    NSFileManager *fm = [NSFileManager defaultManager];
    // 获得当前目录
    NSString *currentPath = [fm currentDirectoryPath];
    NSLog(@"currentPath = %@",currentPath);
}
// 遍历目录内容
-(void)listDir{
    // 实例化NSFileManager
    NSFileManager *fm = [NSFileManager defaultManager];
    // 文件目录
    NSString *path = @"/tmp";
    // 遍历文件
    NSArray *content = [fm contentsOfDirectoryAtPath:path error:nil];
    for(NSString *item in content){
        NSLog(@"%@",item);
    }
}
@end
