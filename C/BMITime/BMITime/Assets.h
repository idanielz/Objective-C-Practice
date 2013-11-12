//
//  Assets.h
//  BMITime
//
//  Created by DanielZ on 13-11-9.
//  Copyright (c) 2013年 DanielZ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Assets : NSObject
{
    NSString *label;
    unsigned int resaleValue;
}

@property (strong) NSString *label;
@property unsigned int resaleValue;
@end
