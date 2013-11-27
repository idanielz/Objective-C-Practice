//
//  DbUtil.m
//  DataStore03-sqlite
//
//  Created by Mahmood1 on 10/26/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "DbUtil.h"

@implementation DbUtil

// 获得数据库保存路径
-(NSString*)getPath{
    // 获得文件路径
    NSArray *docPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *path = [docPaths objectAtIndex:0];
    // 创建数据库路径
    path = [path stringByAppendingPathComponent:kDbName];
    return  path;
}
// 打开数据库
-(sqlite3*)open{
    // 声明数据库
    sqlite3 *database;
    // 获得数据库路径
    NSString *path = [self getPath];
    NSLog(@"%@",path);
    // 打开库
    NSInteger result = sqlite3_open([path UTF8String], &database);
    if (result==SQLITE_OK) {
        // 返回数据库
        return database;
    }
    return nil;
}
// 关闭库
-(void)close:(sqlite3 *)db{
    if(db!=nil)
        sqlite3_close(db);
}

// 创建表
-(void)createTable:(sqlite3 *)db{
    // 创建表sql语句
    char *sql = "create table PerTbl (pid integer primary key autoincrement, name text,pwd text) ";
    // 执行sql语句创建表
    int result = sqlite3_exec(db, sql, 0, nil, nil);
    // 判断是否创建成功
    if (result==SQLITE_OK) {
        NSLog(@"%@",@"create ok.");
    }else{
         NSLog(@"%@",@"create fail.");
    }
}
// 插入数据
-(void)insert:(Person *)per{
    // 打开数据库
    sqlite3 *db = [self open];
    // 插入sql语句
    char *sql = "insert into PerTbl(name,pwd)values(?,?) ";
    // 预定义语句
    sqlite3_stmt *stmt;
    //准备预定义语句
    if(sqlite3_prepare_v2(db, sql , -1, &stmt, nil)==SQLITE_OK){
        // 绑定数据
        sqlite3_bind_text(stmt, 1, "tom", -1, nil);
        sqlite3_bind_text(stmt, 2, "123", -1, nil);
    }
    // 执行sql
    if(sqlite3_step(stmt)==SQLITE_DONE){
        NSLog(@"%@",@"insert ok.");
    }else{
        NSLog(@"%@",@"insert fail.");
    }
    // 释放语句
    sqlite3_finalize(stmt);
    // 关闭数据库
    [self close:db];
}
// 删除数据
-(void)del:(int)pid{
    // 打开数据库
    sqlite3 *db = [self open];
    // 准备sql
    char *sql = "delete from PerTbl where pid=? ";
    // 定义预定义语句
    sqlite3_stmt *stmt;
    // 准备预定义语句
    if(sqlite3_prepare_v2(db, sql , -1, &stmt, nil)==SQLITE_OK){
        // 绑定数据
        sqlite3_bind_int(stmt, 1, pid);
    }
    // 执行语句
    if(sqlite3_step(stmt)==SQLITE_DONE){
        NSLog(@"%@",@"del ok.");
    }else{
        NSLog(@"%@",@"del fail.");
    }
    // 释放资源
    sqlite3_finalize(stmt);
    // 关闭数据库
    [self close:db];
}
// 更新
-(void)update:(Person *)per{
    // 打开库
    sqlite3 *db = [self open];
    // sql 
    char *sql = "update PerTbl set name =?,pwd=? where pid=?";
    // 声明预定义语句
    sqlite3_stmt *stmt;
    // 准备预定义
    if(sqlite3_prepare_v2(db, sql , -1, &stmt, nil)==SQLITE_OK){
        // 绑定数据
        sqlite3_bind_text(stmt, 1, [[per name] UTF8String], -1, nil);
        sqlite3_bind_text(stmt, 2, [[per pwd]UTF8String], -1, nil);
        sqlite3_bind_int(stmt, 3, [per pid]);
    }
    // 执行预定义语句
    if(sqlite3_step(stmt)==SQLITE_DONE){
        NSLog(@"%@",@"update ok.");
    }else{
        NSLog(@"%@",@"update fail.");
    }
    // 释放资源
    sqlite3_finalize(stmt);
    // 关闭数据库
    [self close:db];
}
// 查询
-(NSMutableArray*)query{
    // 打开数据库
    sqlite3 *db = [self open];
    // 查询sql
    char *sql = " select pid,name,pwd from PerTbl ";
    // 预定义语句
    sqlite3_stmt *stmt;
    // 可变数组
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:10];
    // 准备预定义语句
    if(sqlite3_prepare_v2(db, sql , -1, &stmt, nil)==SQLITE_OK){
        // 循环获得数据
        while (sqlite3_step(stmt)==SQLITE_ROW) {
            // 获得第一列数据
            int pid = sqlite3_column_int(stmt, 0);
            // 第二列
            const char *name = (char*)sqlite3_column_text(stmt, 1);
            // 第三列
            char *pwd = (char*)sqlite3_column_text(stmt, 2);
            // 实例化Person
            Person *per = [[Person alloc]init];
            // 赋值
            [per setPid:pid];
            [per setPwd:[NSString stringWithUTF8String:pwd]];
            [per setName:[NSString stringWithUTF8String:name]];
            
            // 添加到数组
            [array addObject:per];
        }
    }
    // 是否资源
    sqlite3_finalize(stmt);
    // 关闭数据库
    [self close:db];
    return array;
}

-(Person*)findPerson:(int)pid{

    return nil;
}


@end
