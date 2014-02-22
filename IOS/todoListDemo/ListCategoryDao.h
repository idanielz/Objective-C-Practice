//
//  ListCategoryDao.h
//  todoListDemo
//
//  Created by DanielZ on 14-2-21.
//  Copyright (c) 2014年 DanielZ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ListCategory.h"
@interface ListCategoryDao : NSObject

@property (nonatomic,strong)NSManagedObjectContext * context;

- (void)add:(NSString *)name;
- (void)del:(ListCategory *)lc;
- (NSArray *)query;
@end
