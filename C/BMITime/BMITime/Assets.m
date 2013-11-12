//
//  Assets.m
//  BMITime
//
//  Created by DanielZ on 13-11-9.
//  Copyright (c) 2013年 DanielZ. All rights reserved.
//

#import "Assets.h"
#import "Employee.h"

@implementation Assets

@synthesize label, resaleValue, holder;

- (NSString *)description
{
    //return [NSString stringWithFormat:@"< %@: $%d >", [self label], [self resaleValue]];
    if (holder)
        return [NSString stringWithFormat:@"< %@: $%d is assigned to %@ >", [self label], [self resaleValue], [self holder]];
    else
        return [NSString stringWithFormat:@"< %@: $%d is unassigned >", [self label], [self resaleValue]];
}

- (void)dealloc
{
    NSLog(@"deallocating %@", self);
}


@end
