//
//  ForeignStockHolding.m
//  Stocks
//
//  Created by DanielZ on 13-11-9.
//  Copyright (c) 2013年 DanielZ. All rights reserved.
//

#import "ForeignStockHolding.h"

@implementation ForeignStockHolding

@synthesize conversionRate;

- (float)costInDollars
{
    return conversionRate * purchaseSharePrice * numberOfShares;
}

- (float)valueInDollars
{
    return conversionRate * currentSharePrice * numberOfShares;
}
@end
