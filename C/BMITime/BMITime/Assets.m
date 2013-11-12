//
//  Assets.m
//  BMITime
//
//  Created by DanielZ on 13-11-9.
//  Copyright (c) 2013年 DanielZ. All rights reserved.
//

#import "Assets.h"

@implementation Assets

@synthesize label, resaleValue;

- (NSString *)description
{
    return [NSString stringWithFormat:@"< %@: $%d >", [self label], [self resaleValue]];
}

- (void)dealloc
{
    NSLog(@"deallocating %@", self);
}
@end
