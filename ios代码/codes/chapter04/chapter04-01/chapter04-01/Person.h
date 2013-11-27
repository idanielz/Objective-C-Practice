//
//  Person.h
//  chapter04-01
//
//  Created by amaker on 2/28/13.
//  Copyright (c) 2013 amaker. All rights reserved.
//

#import <Foundation/Foundation.h>
@interface Person : NSObject
{
    int age;
    NSString *name;
}
-(void)printMsg;
@end
