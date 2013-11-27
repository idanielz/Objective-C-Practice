//
//  CoreDataUtil.m
//  chapter23-02
//  Created by amaker on 3/7/13.
//  Copyright (c) 2013 amaker. All rights reserved.
//

#import "CoreDataUtil.h"
#import "AmakerAppDelegate.h"
#import "Customer.h"
#import "Order.h"
// 声明静态 NSManagedObjectContext
static NSManagedObjectContext *context;
@implementation CoreDataUtil
// 初始化方法
- (id)init
{
    self = [super init];
    if (self) {
        // 从AmakerAppDelegate中获得NSManagedObjectContext实例
        if (context==nil) {
            AmakerAppDelegate *delegate = [UIApplication sharedApplication].delegate;
            context = delegate.managedObjectContext;
        }
    }
    return self;
}
// 添加客户
-(void)addCustomer{
    // 使用NSEntityDescription的静态方法insertNewObjectForEntityForName，创建一个客户对象
    Customer *c = [NSEntityDescription insertNewObjectForEntityForName:@"Customer" inManagedObjectContext:context];
    if (c!=nil) {
        // 为客户属性赋值
        c.age = [NSNumber numberWithInt:20];
        c.name = @"tom";
        // 使用NSManagedObjectContext保存客户
        BOOL result = [context save:nil];
        // 判断是否保存成功
        if (result) {
            NSLog(@"Save OK!");
        }else{
            NSLog(@"Save Fail!");
        }
    }
}
// 删除客户
-(void)deleteCustomer{
    [self addCustomer];
    // 实例化NSFetchRequest，用来查询
    NSFetchRequest *request = [[NSFetchRequest alloc]init];
    // 通过实体名称实例化NSEntityDescription对象
    NSEntityDescription *c = [NSEntityDescription entityForName:@"Customer" inManagedObjectContext:context];
    // 设置查询对象
    [request setEntity:c];
    // 进行查询
    NSArray *customers = [context executeFetchRequest:request error:nil];
    // 如果查询结果大于0，获得第一个对象，并删除
    if ([customers count]>0) {
        // 获得集合中的第一个对象
        Customer *c1 = [customers objectAtIndex:0];
        // 删除之
        [context deleteObject:c1];
        // 保存
        BOOL result = [context save:nil];
        // 判断结果
        if (result) {
            NSLog(@"Delete OK!");
        }else{
            NSLog(@"Delete Fail!");
        }
    }
}
// 更新客户，和查询类似，首先查询到要更新的对象，重新设置属性，并调用save方法保存
-(void)updateCustmer{
    [self addCustomer];
    // 实例化NSFetchRequest对象
    NSFetchRequest *request = [[NSFetchRequest alloc]init];
    // 获得NSEntityDescription实例
    NSEntityDescription *c = [NSEntityDescription entityForName:@"Customer" inManagedObjectContext:context];
    // 设置查询实体
    [request setEntity:c];
    // 执行查询
    NSArray *customers = [context executeFetchRequest:request error:nil];
    
    if ([customers count]>0) {
        Customer *c1 = [customers objectAtIndex:0];
        // 重新设置属性
        [c1 setAge:[NSNumber numberWithInt:100]];
        [c1 setName:@"new name"];
        // 保存
        BOOL result = [context save:nil];
        // 判断结果
        if (result) {
            NSLog(@"update OK!");
        }else{
            NSLog(@"update Fail!");
        }
    }
}
// 查询客户
-(void)queryCustomer{
    [self addCustomer];
    // 实例化NSFetchRequest
    NSFetchRequest *request = [[NSFetchRequest alloc]init];
    // 通过指定的实体对象实例化NSEntityDescription
    NSEntityDescription *c = [NSEntityDescription entityForName:@"Customer" inManagedObjectContext:context];
    // 为查询对象设置查询的实体
    [request setEntity:c];
    // 执行查询
    NSArray *customers = [context executeFetchRequest:request error:nil];
    // 遍历，输出
    for(Customer *c in customers){
        NSLog(@"%@,%@",c.name,c.age);
    }
}
// 添加订单
-(void)addOrder{
    NSFetchRequest *request = [[NSFetchRequest alloc]init];
    NSEntityDescription *c = [NSEntityDescription entityForName:@"Customer" inManagedObjectContext:context];
    
    [request setEntity:c];
    
    NSArray *customers = [context executeFetchRequest:request error:nil];
    Customer *c1;
    if ([customers count]>0) {
         c1 = [customers objectAtIndex:0];
    }
    
    Order *o = [NSEntityDescription insertNewObjectForEntityForName:@"Order" inManagedObjectContext:context];
    if (o!=nil) {
        o.name = @"Order Name";
        o.customer = c1;
        
        BOOL result = [context save:nil];
        if (result) {
            NSLog(@"save order ok!");
        }else{
            NSLog(@"save order fail!");
        }
    }
}
-(void)deleteOrder{
    NSFetchRequest *request = [[NSFetchRequest alloc]init];
    NSEntityDescription *c = [NSEntityDescription entityForName:@"Order" inManagedObjectContext:context];
    
    [request setEntity:c];
    
    NSArray *orders = [context executeFetchRequest:request error:nil];
    Order *o1;
    if ([orders count]>0) {
        o1 = [orders objectAtIndex:0];
    }
    
    [context deleteObject:o1];
    BOOL result = [context save:nil];
    if (result) {
        NSLog(@"save order ok!");
    }else{
        NSLog(@"save order fail!");
    }
}
-(void)updateOrder{
    NSLog(@"here");
    [self addOrder];
    NSFetchRequest *request = [[NSFetchRequest alloc]init];
    NSEntityDescription *o = [NSEntityDescription entityForName:@"Order" inManagedObjectContext:context];
    
    [request setEntity:o];
    
    NSArray *orders = [context executeFetchRequest:request error:nil];
    Order *o1;
    if ([orders count]>0) {
        o1 = [orders objectAtIndex:0];
        o1.name = @"new order";
        
        BOOL result = [context save:nil];
        if (result) {
            NSLog(@"update order ok!");
        }else{
            NSLog(@"update order fail!");
        }
    }

}
-(void)queryOrder{
    [self addOrder];
    [self addOrder];
    [self addOrder];
    NSFetchRequest *request = [[NSFetchRequest alloc]init];
    NSEntityDescription *o = [NSEntityDescription entityForName:@"Order" inManagedObjectContext:context];
    
    [request setEntity:o];
    
    NSArray *orders = [context executeFetchRequest:request error:nil];
    for(Order *o in orders){
        NSLog(@"%@",o.name);
    }
}
// 根据客户，条件查询订单
-(void)queryOrderByCustomer{
    // 实例化NSFetchRequest
    NSFetchRequest *request = [[NSFetchRequest alloc]init];
    // 根据实体类名称，获得NSEntityDescription实例
    NSEntityDescription *c = [NSEntityDescription entityForName:@"Customer" inManagedObjectContext:context];
    // 设置查询实体
    [request setEntity:c];
    // 执行查询，获得第一个客户
    NSArray *customers = [context executeFetchRequest:request error:nil];
    Customer *c1;
    if ([customers count]>0) {
        c1 = [customers objectAtIndex:0];
    }
    // 实例化NSFetchRequest
    NSFetchRequest *request2 = [[NSFetchRequest alloc]init];
    // 根据实体类名称，获得NSEntityDescription实例
    NSEntityDescription *o = [NSEntityDescription entityForName:@"Order" inManagedObjectContext:context];
    // 实例化NSPredicate
    NSPredicate *p = [NSPredicate predicateWithFormat:@"customer=%@",c1];
    // 为请求指定条件
    request2.predicate = p;
    // 设置查询实体
    [request2 setEntity:o];
    //执行查询
    NSArray *orders = [context executeFetchRequest:request error:nil];
    // 遍历，输出
    for(Order *o in orders){
        NSLog(@"%@",o.name);
    }
}
@end
