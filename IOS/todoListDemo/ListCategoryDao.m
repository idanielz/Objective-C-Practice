//
//  ListCategoryDao.m
//  todoListDemo
//
//  Created by DanielZ on 14-2-21.
//  Copyright (c) 2014年 DanielZ. All rights reserved.
//

#import "ListCategoryDao.h"
#import "AppDelegate.h"

@interface ListCategoryDao()
@end
@implementation ListCategoryDao

- (void)add:(NSString *)name{
    ListCategory *lc = [NSEntityDescription insertNewObjectForEntityForName:@"ListCategory" inManagedObjectContext:self.context];
    if(lc!=nil){
        lc.name = name;
        BOOL result = [self.context save:nil];
        if(result){
            NSLog(@"Save OK");
        }
        else{
            NSLog(@"Save error!");
        }
    }
    
}
- (void)del:(ListCategory *)lc{
    [self.context deleteObject:lc];
    BOOL result = [self.context save:nil];
    if(result){
        NSLog(@"Delete OK");
    }
    else{
        NSLog(@"Delete Error!");
    }
}
- (NSArray *)query{
    NSFetchRequest *request = [[NSFetchRequest alloc]init];
    NSEntityDescription *desc = [NSEntityDescription entityForName:@"ListCategory"  inManagedObjectContext:self.context];
   request.entity = desc;
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
