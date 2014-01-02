//
//  Person.m
//  NSCodingDemo
//
//  Created by DanielZ on 13-12-1.
//  Copyright (c) 2013年 DanielZ. All rights reserved.
//

#import "Person.h"

@implementation Person

@synthesize name, age;

- (void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeObject:name forKey:@"name"];
    [aCoder encodeInt:age forKey:@"age"];
}

- (id)initWithCoder:(NSCoder *)aDecoder{
    name = [aDecoder decodeObjectForKey:@"name"];
    age = [aDecoder decodeIntForKey:@"age"];
    [self setName:name];
    [self setAge:age];
    return self;
}
@end
