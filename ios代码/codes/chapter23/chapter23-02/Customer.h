//
//  Customer.h
//  chapter23-02
//
//  Created by amaker on 3/7/13.
//  Copyright (c) 2013 amaker. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Customer : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSNumber * age;

@end
