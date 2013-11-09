//
//  main.m
//  Stocks
//
//  Created by DanielZ on 13-11-2.
//  Copyright (c) 2013年 DanielZ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "StockHolding.h"
#import "ForeignStockHolding.h"
#import "Portfolio.h"

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
        
        ForeignStockHolding *s4 = [[ForeignStockHolding alloc] init];
        [s4 setPurchaseSharePrice:45.30];
        [s4 setCurrentSharePrice:49.50];
        [s4 setNumberOfShares:210];
        [s4 setConversionRate:0.8];
        [array addObject:s4];
        
        for (StockHolding *a in array)
        {
            NSLog(@"%.2f, %.2f, %d, %.2f, %.2f", a.purchaseSharePrice, a.currentSharePrice, a.numberOfShares, [a costInDollars], [a valueInDollars]);
        }
        Portfolio *p1 = [[Portfolio alloc] init];
        [p1 setStockOwner:@"aaa"];
        Portfolio *p2 = [[Portfolio alloc] init];
        [p2 setStockOwner:@"bbb"];
        Portfolio *p3 = [[Portfolio alloc] init];
        [p3 setStockOwner:@"ccc"];
        Portfolio *p4 = [[Portfolio alloc] init];
        [p4 setStockOwner:@"ddd"];
        [p1 setStock:s1];
        [p2 setStock:s2];
        [p3 setStock:s3];
        [p4 setStock:s4];
        NSMutableArray *p = [NSMutableArray array] ;
        [p addObject:p1];
        [p addObject:p2];
        [p addObject:p3];
        [p addObject:p4];
        for ( Portfolio *pf in p)
        {
            NSLog(@"%@, $%.2f",pf.StockOwner,[pf getStock]);
        }
    }
    return 0;
}

