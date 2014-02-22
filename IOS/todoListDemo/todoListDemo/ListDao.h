//
//  ListDao.h
//  todoListDemo
//
//  Created by DanielZ on 14-2-22.
//  Copyright (c) 2014年 DanielZ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "List.h"
#import "ListCategory.h"
@interface ListDao : NSObject

@property (nonatomic, strong) NSManagedObjectContext * context;

- (void)add:(NSString *)content andFireDate:(NSDate *)date andCategory:(ListCategory *)lc;
- (void)del:(List *)list;
- (NSArray *)query;
- (NSArray *)queryWithCategory:(ListCategory *)lc;
@end
