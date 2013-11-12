//
//  Assets.h
//  BMITime
//
//  Created by DanielZ on 13-11-9.
//  Copyright (c) 2013年 DanielZ. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Employee;

@interface Assets : NSObject
{
    NSString *label;
    unsigned int resaleValue;
    __weak Employee *holder;//使用弱指针，当asset所属的对象被释放之后，指针自动置为nil
}

@property (strong) NSString *label;
@property unsigned int resaleValue;
@property (weak) Employee *holder;

@end
