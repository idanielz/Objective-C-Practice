//
//  List.h
//  todoListDemo
//
//  Created by DanielZ on 14-2-21.
//  Copyright (c) 2014年 DanielZ. All rights reserved.
//

//MVC Model

//DAO


#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class ListCategory;

@interface List : NSManagedObject

@property (nonatomic, retain) NSDate * fireDate;
@property (nonatomic, retain) NSString * content;
@property (nonatomic, retain) ListCategory *category;

@end
