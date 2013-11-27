//
//  AmakerRootViewController.h
//  chapter23-02
//
//  Created by amaker on 3/7/13.
//  Copyright (c) 2013 amaker. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CoreDataUtil;
@interface AmakerRootViewController : UIViewController

@property(nonatomic,strong)CoreDataUtil *util;

- (IBAction)addCustomer:(id)sender;
- (IBAction)deleteCustomer:(id)sender;
- (IBAction)updateCustomer:(id)sender;
- (IBAction)queryCustomer:(id)sender;


- (IBAction)addOrder:(id)sender;
- (IBAction)deleteOrder:(id)sender;
- (IBAction)updateOrder:(id)sender;
- (IBAction)queryOrder:(id)sender;
- (IBAction)queryOrderByCustomer:(id)sender;

@end
