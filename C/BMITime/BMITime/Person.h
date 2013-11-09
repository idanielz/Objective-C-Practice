//
//  Person.h
//  BMITime
//
//  Created by DanielZ on 13-11-2.
//  Copyright (c) 2013年 DanielZ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject
{
    //Person类具有两个实例变量
    float heightInMeters;
    int weightInKilos;
}
@property float heightInmeters;
@property int weightInKilos;

- (float) bodyMassIndex;

@end
