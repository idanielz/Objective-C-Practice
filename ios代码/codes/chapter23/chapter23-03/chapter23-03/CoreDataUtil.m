//
//  CoreDataUtil.m
//  chapter23-03
//
//  Created by amaker on 3/7/13.
//  Copyright (c) 2013 amaker. All rights reserved.
//

#import "CoreDataUtil.h"
#import "AmakerAppDelegate.h"
static NSManagedObjectContext *context;

@implementation CoreDataUtil
- (id)init
{
    self = [super init];
    if (self) {
        AmakerAppDelegate *delegate = [[UIApplication sharedApplication] delegate];
        context = delegate.managedObjectContext;
    }
    return self;
}

-(void)addCustomer:(NSString*)name{
    Customer *c = [NSEntityDescription insertNewObjectForEntityForName:@"Customer" inManagedObjectContext:context];
    if (c!=nil) {
        c.name = name;
        BOOL result = [context save:nil];
        if (result) {
            NSLog(@"save ok!");
        }else{
            NSLog(@"save fail!");
        }
    }
}
-(void)deleteCustomer:(Customer*)c{
    [context deleteObject:c];
    BOOL result = [context save:nil];
    if (result) {
        NSLog(@"delete ok!");
    }else{
        NSLog(@"delete fail!");
    }

}
-(void)updateCustomer:(Customer*)c{
    BOOL result = [context save:nil];
    if (result) {
        NSLog(@"update ok!");
    }else{
        NSLog(@"update fail!");
    }
}
-(NSArray*)queryCustoer{
    NSFetchRequest *request = [[NSFetchRequest alloc]init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Customer" inManagedObjectContext:context];
    [request setEntity:entity];
    return [context executeFetchRequest:request error:nil];;
}
@end
