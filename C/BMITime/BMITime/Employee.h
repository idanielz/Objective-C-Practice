//
//  Employee.h
//  BMITime
//
//  Created by DanielZ on 13-11-2.
//  Copyright (c) 2013年 DanielZ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
@class Assets;

@interface Employee : Person
{
    int employID;
    NSMutableArray *assets;
}
@property int employID;

- (float)bodyMassIndex;

- (void)addAssetsObject:(Assets *)a;

- (unsigned int)valueOfAssets;

@end
