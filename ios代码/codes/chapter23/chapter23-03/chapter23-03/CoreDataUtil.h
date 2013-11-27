//
//  CoreDataUtil.h
//  chapter23-03
//
//  Created by amaker on 3/7/13.
//  Copyright (c) 2013 amaker. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Customer.h"
@interface CoreDataUtil : NSObject
-(void)addCustomer:(NSString*)name;
-(void)deleteCustomer:(Customer*)c;
-(void)updateCustomer:(Customer*)c;
-(NSArray*)queryCustoer;
@end
