//
//  Mobile.h
//  chapter08-02
//
//  Created by amaker on 4/17/13.
//  Copyright (c) 2013 amaker. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "USB.h"
#import "Media.h"
// 同时实现USB协议和Media协议
@interface Mobile : NSObject<USB,Media>

@end
