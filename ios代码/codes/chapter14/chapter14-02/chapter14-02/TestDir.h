//
//  TestDir.h
//  chapter14-02
//
//  Created by amaker on 3/11/13.
//  Copyright (c) 2013 amaker. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TestDir : NSObject
// 创建目录
-(void)createDir;
// 删除目录
-(void)removeDir;
// 获得当前路径
-(void)getCurrentDir;
// 遍历目录内容
-(void)listDir;
@end
