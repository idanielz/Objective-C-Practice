//
//  CalculatorModel.m
//  chapter17-01
//
//  Created by amaker on 4/9/13.
//  Copyright (c) 2013 amaker. All rights reserved.
//

#import "CalculatorModel.h"

@implementation CalculatorModel
// 实现计算方法
-(double)calculate:(double)num andOperator:(NSString *)ope{
    // 根据操作法进行计算
    if ([ope isEqualToString:@"+"]) {
        self.result+=num;
    }
    if ([ope isEqualToString:@"-"]) {
        self.result-=num;
    }
    if ([ope isEqualToString:@"*"]) {
        self.result*=num;
    }
    if ([ope isEqualToString:@"/"]) {
        self.result/=num;
    }
    // 返回计算结果
    return self.result;
}
@end
