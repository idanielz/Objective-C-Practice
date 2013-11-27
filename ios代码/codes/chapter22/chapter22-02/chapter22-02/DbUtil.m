//
//  DbUtil.m
//  DataStore03-sqlite
//
//  Created by Mahmood1 on 10/26/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "DbUtil.h"

@implementation DbUtil


-(NSString*)getPath{
    NSArray *docPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
    NSString *path = [docPaths objectAtIndex:0];
    path = [path stringByAppendingPathComponent:kDbName];
    return  path;
}

-(sqlite3*)open{
    sqlite3 *database;
    NSString *path = [self getPath];
    NSLog(@"%@",path);
    NSInteger result = sqlite3_open([path UTF8String], &database);
    if (result==SQLITE_OK) {
        return database;
    }
    return nil;
}

-(void)close:(sqlite3 *)db{
    if(db!=nil)
        sqlite3_close(db);
}


-(void)createTable{
    sqlite3 *db = [self open];
    char *sql = "create table PerTbl (pid integer primary key autoincrement, name text,pwd text) ";
    int result = sqlite3_exec(db, sql, 0, nil, nil);
    
    if (result==SQLITE_OK) {
        NSLog(@"%@",@"create ok.");
    }else{
         NSLog(@"%@",@"create fail.");
    }
    [self close:db];
}
-(void)insert:(Person *)per{
    
    sqlite3 *db = [self open];
    char *sql = "insert into PerTbl(name,pwd)values(?,?) ";
    sqlite3_stmt *stmt;
    if(sqlite3_prepare_v2(db, sql , -1, &stmt, nil)==SQLITE_OK){
        sqlite3_bind_text(stmt, 1, [per.name UTF8String], -1, nil);
        sqlite3_bind_text(stmt, 2, [per.pwd UTF8String], -1, nil);
    }
    
    if(sqlite3_step(stmt)==SQLITE_DONE){
        NSLog(@"%@",@"insert ok.");
    }else{
        NSLog(@"%@",@"insert fail.");
    }
    
    sqlite3_finalize(stmt);
    
    [self close:db];
}
-(void)del:(int)pid{
    sqlite3 *db = [self open];
    char *sql = "delete from PerTbl where pid=? ";
    sqlite3_stmt *stmt;
    
    
    if(sqlite3_prepare_v2(db, sql , -1, &stmt, nil)==SQLITE_OK){
        sqlite3_bind_int(stmt, 1, pid);
    }
    
    if(sqlite3_step(stmt)==SQLITE_DONE){
        NSLog(@"%@",@"del ok.");
    }else{
        NSLog(@"%@",@"del fail.");
    }
    
    sqlite3_finalize(stmt);
    
    [self close:db];
}

-(void)update:(Person *)per{
    sqlite3 *db = [self open];
    char *sql = "update PerTbl set name =?,pwd=? where pid=?";
    sqlite3_stmt *stmt;
    if(sqlite3_prepare_v2(db, sql , -1, &stmt, nil)==SQLITE_OK){
        
        sqlite3_bind_text(stmt, 1, [[per name] UTF8String], -1, nil);
        sqlite3_bind_text(stmt, 2, [[per pwd]UTF8String], -1, nil);
        sqlite3_bind_int(stmt, 3, [per pid]);
    }
    
    if(sqlite3_step(stmt)==SQLITE_DONE){
        NSLog(@"%@",@"update ok.");
    }else{
        NSLog(@"%@",@"update fail.");
    }
    
    sqlite3_finalize(stmt);
    
    [self close:db];
}

-(NSMutableArray*)query{
    sqlite3 *db = [self open];
    char *sql = " select pid,name,pwd from PerTbl ";
    sqlite3_stmt *stmt;
    
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:10];
    
    if(sqlite3_prepare_v2(db, sql , -1, &stmt, nil)==SQLITE_OK){
        
        while (sqlite3_step(stmt)==SQLITE_ROW) {
            int pid = sqlite3_column_int(stmt, 0);
            const char *name = (char*)sqlite3_column_text(stmt, 1);
            char *pwd = (char*)sqlite3_column_text(stmt, 2);
            
            Person *per = [[Person alloc]init];
            [per setPid:pid];
            [per setPwd:[NSString stringWithUTF8String:pwd]];
            
            [per setName:[NSString stringWithUTF8String:name]];
            
            //[per rsetPwd:[NSString str
            
            [array addObject:per];
        }
    }
    
    sqlite3_finalize(stmt);
    
    [self close:db];
    
    NSLog(@"count=%d",[array count]);
    
    return array;
}

-(Person*)findPerson:(int)pid{

    return nil;
}


@end
