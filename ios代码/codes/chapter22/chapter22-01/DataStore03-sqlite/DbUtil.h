//
//  DbUtil.h
//  DataStore03-sqlite
//
//  Created by Mahmood1 on 10/26/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
// 导入头文件
#import "/usr/include/sqlite3.h"
#import "Person.h"
// 定义数据库名称
#define kDbName @"test.db"
@interface DbUtil : NSObject

// 获得数据库文件路径方法
-(NSString*)getPath;
// 打开库
-(sqlite3*)open;
// 关闭库
-(void)close:(sqlite3*)db;
// 创建表
-(void)createTable:(sqlite3*)db;
// 插入
-(void)insert:(Person*)per;
// 删除
-(void)del:(int)pid;
// 更新
-(void)update:(Person*)per;
// 查询
-(NSMutableArray*)query;
// 根据id查询
-(Person*)findPerson:(int)pid;

@end
