//
//  Person.h
//  DataStore03-sqlite
//
//  Created by Mahmood1 on 10/26/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
@interface Person : NSObject
// id
@property(nonatomic)int pid;
// 姓名
@property(nonatomic,retain)NSString *name;
// 密码
@property(nonatomic,retain)NSString *pwd;
@end
