//
//  main.m
//  BMITime
//
//  Created by DanielZ on 13-11-2.
//  Copyright (c) 2013年 DanielZ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
#import "Employee.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        // insert code here...
        Employee *person = [[Employee alloc] init];
        [person setHeightInmeters: 1.8];
        [person setWeightInKilos: 50];
        
        NSLog(@"The Employee %.2f height and %d weight 's BMI is %.2f", [person heightInmeters], [person weightInKilos], [person bodyMassIndex]);
        NSLog(@"The Employee %.2f height and %d weight 's BMI is %.2f", [person heightInmeters], [person weightInKilos], [person bodyMassIndex]);
        
    }
    return 0;
}

