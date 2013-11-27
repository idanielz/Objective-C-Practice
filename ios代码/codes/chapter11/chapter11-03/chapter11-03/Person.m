//
//  Person.m
//  chapter11-03
//
//  Created by amaker on 5/15/13.
//  Copyright (c) 2013 amaker. All rights reserved.
//

#import "Person.h"

@implementation Person
-(void)setPid:(NSString *)pid{
    self.pid = pid;
}
-(void)setName:(NSString *)name{
    if (name!=self.name) {
        [self.name release];
        self.name = [name retain];
    }
}
-(void)setEmail:(NSString *)email{
    if (self.email!=email) {
        [self.email release];
        self.email = [email copy];
    }
}
@end
