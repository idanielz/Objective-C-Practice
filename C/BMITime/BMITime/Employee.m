//
//  Employee.m
//  BMITime
//
//  Created by DanielZ on 13-11-2.
//  Copyright (c) 2013年 DanielZ. All rights reserved.
//

#import "Employee.h"

@implementation Employee

@synthesize employID;

- (float)bodyMassIndex
{
    float nomalBMI = [super bodyMassIndex];
    return nomalBMI * 0.9;
}
@end
