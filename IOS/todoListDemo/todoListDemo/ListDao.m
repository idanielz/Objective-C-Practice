//
//  ListDao.m
//  todoListDemo
//
//  Created by DanielZ on 14-2-22.
//  Copyright (c) 2014年 DanielZ. All rights reserved.
//

#import "ListDao.h"
#import "AppDelegate.h"
@implementation ListDao

- (void)add:(NSString *)content andFireDate:(NSDate *)date andCategory:(ListCategory *)lc{
    List *list = [NSEntityDescription insertNewObjectForEntityForName:@"List" inManagedObjectContext:self.context];
    if (list != nil) {
        list.content = content;
        list.fireDate = date;
        list.category = lc;
        BOOL flag = [self.context save:nil];
        if (flag) {
            NSLog(@"Save Ok!");
        }else{
            NSLog(@"Save Error!!!");
        }
    }
}

- (void)del:(List *)list{
    [self.context deleteObject:list];
    BOOL flag = [self.context save:nil];
    if (flag) {
        NSLog(@"Delete Ok!");
    }else{
        NSLog(@"Delete Error!!!");
    }
}
- (NSArray *)query{
    return nil;
}

- (NSArray *)queryWithCategory:(ListCategory *)lc{
    NSFetchRequest *request = [[NSFetchRequest alloc]init];
    NSEntityDescription *desc = [NSEntityDescription entityForName:@"List" inManagedObjectContext:self.context];
    request.entity = desc;
    request.predicate = [NSPredicate predicateWithFormat:@"category=%@",lc];
    return [self.context executeFetchRequest:request error:nil];
}
- (id)init
{
    self = [super init];
    if (self) {
        AppDelegate *delegate = [[UIApplication sharedApplication]delegate];
        self.context = [delegate managedObjectContext];
    }
    return self;
}
@end
