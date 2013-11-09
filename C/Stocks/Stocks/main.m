//
//  main.m
//  Stocks
//
//  Created by DanielZ on 13-11-2.
//  Copyright (c) 2013年 DanielZ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "StockHolding.h"
int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        // insert code here...
        NSMutableArray *array = [NSMutableArray array] ;
        
        StockHolding *s1 = [[StockHolding alloc] init];
        [s1 setPurchaseSharePrice:2.30];
        [s1 setCurrentSharePrice:4.50];
        s1.numberOfShares = 40;
        [array addObject:s1];
        StockHolding *s2 = [[StockHolding alloc] init];
        [s2 setPurchaseSharePrice:12.30];
        [s2 setCurrentSharePrice:10.50];
        s2.numberOfShares = 90;
        [array addObject:s2];
        StockHolding *s3 = [[StockHolding alloc] init];
        [s3 setPurchaseSharePrice:45.30];
        [s3 setCurrentSharePrice:49.50];
        s3.numberOfShares = 210;
        [array addObject:s3];
        for (StockHolding *a in array)
        {
            NSLog(@"%.2f, %.2f, %d, %.2f, %.2f", a.purchaseSharePrice, a.currentSharePrice, a.numberOfShares, [a costInDollars], [a valueInDollars]);
        }
        
    }
    return 0;
}

