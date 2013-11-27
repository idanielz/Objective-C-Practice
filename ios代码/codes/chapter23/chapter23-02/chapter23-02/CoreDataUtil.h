//
//  CoreDataUtil.h
//  chapter23-02
//
//  Created by amaker on 3/7/13.
//  Copyright (c) 2013 amaker. All rights reserved.
//

#import <Foundation/Foundation.h>
@interface CoreDataUtil : NSObject
// 添加客户
-(void)addCustomer;
// 删除客户
-(void)deleteCustomer;
// 更新客户
-(void)updateCustmer;
// 查询客户
-(void)queryCustomer;
// 添加订单
-(void)addOrder;
// 删除订单
-(void)deleteOrder;
// 更新订单
-(void)updateOrder;
// 查询订单
-(void)queryOrder;
// 根据客户查询订单
-(void)queryOrderByCustomer;

@end
