//
//  CalculatorModel.h
//  chapter17-01
//
//  Created by amaker on 4/9/13.
//  Copyright (c) 2013 amaker. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CalculatorModel : NSObject
// 计算结果
@property(nonatomic)double result;
// 计算方法
-(double)calculate:(double)num andOperator:(NSString*)ope;
@end
