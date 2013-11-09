//
//  Employee.h
//  BMITime
//
//  Created by DanielZ on 13-11-2.
//  Copyright (c) 2013年 DanielZ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
@interface Employee : Person
{
    int employID;
}
@property int employID;

- (float)bodyMassIndex;
@end
