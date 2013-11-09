//
//  Portfolio.m
//  Stocks
//
//  Created by DanielZ on 13-11-9.
//  Copyright (c) 2013年 DanielZ. All rights reserved.
//

#import "Portfolio.h"
#import "StockHolding.h"

@implementation Portfolio

@synthesize StockOwner;
@synthesize stock;

- (float)getStock
{

    return stock.valueInDollars;
}

@end
