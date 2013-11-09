//
//  Person.m
//  BMITime
//
//  Created by DanielZ on 13-11-2.
//  Copyright (c) 2013年 DanielZ. All rights reserved.
//

#import "Person.h"

@implementation Person

@synthesize heightInmeters,weightInKilos;

- (float) bodyMassIndex
{
    return weightInKilos / (heightInmeters * heightInmeters);
}
@end
