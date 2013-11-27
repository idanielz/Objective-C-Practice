//
//  Person.h
//  DataStore03-sqlite
//
//  Created by Mahmood1 on 10/26/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject

@property(nonatomic)int pid;
@property(nonatomic,retain)NSString *name;
@property(nonatomic,retain)NSString *pwd;

@end
