//
//  ForeignStockHolding.h
//  Stocks
//
//  Created by DanielZ on 13-11-9.
//  Copyright (c) 2013年 DanielZ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "StockHolding.h"

@interface ForeignStockHolding : StockHolding
{
    float conversionRate;
}
@property float conversionRate;

@end
