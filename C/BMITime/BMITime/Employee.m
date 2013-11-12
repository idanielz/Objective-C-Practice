//
//  Employee.m
//  BMITime
//
//  Created by DanielZ on 13-11-2.
//  Copyright (c) 2013年 DanielZ. All rights reserved.
//

#import "Employee.h"
#import "Assets.h"

@implementation Employee

@synthesize employID;

- (float)bodyMassIndex
{
    float nomalBMI = [super bodyMassIndex];
    return nomalBMI * 0.9;
}

- (void)addAssetsObject:(Assets *)a
{
    if (!assets)
    {
        assets = [[NSMutableArray alloc] init];
    }
    [assets addObject:a];
    [a setHolder:self];//反向调用所有者对象，导致Retain循环，对象无法释放，内存泄露
}

- (unsigned int)valueOfAssets
{
    unsigned int sum = 0;
    for (Assets *a in assets)
    {
        sum += a.resaleValue;
    }
    return sum;
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"< Employee %d : $%d in assets >", [self employID], [self valueOfAssets]];
}

- (void)dealloc
{
    NSLog(@"deallocating %@", self);
}
@end
