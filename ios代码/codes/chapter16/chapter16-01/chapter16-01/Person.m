//
//  Person.m
//  MyDemo
//
//  Created by Mahmood1 on 10/11/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Person.h"

@implementation Person
@synthesize age;
@synthesize name;

// 编码
-(void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeInt:age forKey:@"age"];
    [aCoder encodeObject:name forKey:@"name"];
}
// 解码
-(id)initWithCoder:(NSCoder *)aDecoder{
    age = [aDecoder decodeIntForKey:@"age"];
    name = [aDecoder decodeObjectForKey:@"name"];
    return self;
}

-(void)setName:(NSString *)name1{
    name = [name1 copy];
}

-(id)copyWithZone:(NSZone *)zone{
    Person *per = [[Person allocWithZone:zone]init];
    return per;
}
@end
