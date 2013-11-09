//
//  Portfolio.h
//  Stocks
//
//  Created by DanielZ on 13-11-9.
//  Copyright (c) 2013年 DanielZ. All rights reserved.
//

#import <Foundation/Foundation.h>
@class StockHolding;

@interface Portfolio : NSObject
{
    NSString *StockOwner;
    StockHolding *stock;
}

@property NSString *StockOwner;
@property StockHolding *stock;
- (float)getStock;

@end
