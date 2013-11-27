//
//  AmakerViewController.h
//  chapter17-01
//
//  Created by amaker on 4/9/13.
//  Copyright (c) 2013 amaker. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CalculatorModel.h"
@interface AmakerViewController : UIViewController
// 引用Model部分
@property(nonatomic,strong)CalculatorModel *model;
// 结果标签
@property(nonatomic,strong)IBOutlet UILabel *resultLabel;
// 操作符
@property(nonatomic,strong)NSString *currentOperator;
// 数字按钮被按下
-(IBAction)digitPress:(id)sender;
// 操作符被按下
-(IBAction)operatorPress:(id)sender;
// 结果按钮被按下
-(IBAction)resultPress:(id)sender;
// 清除按钮被按下
-(IBAction)cleanPress:(id)sender;
@end
