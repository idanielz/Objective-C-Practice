//
//  DbUtil.h
//  DataStore03-sqlite
//
//  Created by Mahmood1 on 10/26/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "/usr/include/sqlite3.h"
#import "Person.h"
#define kDbName @"test.db"

@interface DbUtil : NSObject

-(NSString*)getPath;
-(sqlite3*)open;
-(void)close:(sqlite3*)db;

-(void)createTable;

-(void)insert:(Person*)per;
-(void)del:(int)pid;
-(void)update:(Person*)per;
-(NSMutableArray*)query;
-(Person*)findPerson:(int)pid;

@end
