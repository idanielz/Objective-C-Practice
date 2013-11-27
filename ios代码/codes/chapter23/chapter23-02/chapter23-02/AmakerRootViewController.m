//
//  AmakerRootViewController.m
//  chapter23-02
//
//  Created by amaker on 3/7/13.
//  Copyright (c) 2013 amaker. All rights reserved.
//

#import "AmakerRootViewController.h"
#import "CoreDataUtil.h"
@interface AmakerRootViewController ()

@end

@implementation AmakerRootViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.util = [[CoreDataUtil alloc]init];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (IBAction)addCustomer:(id)sender {
    [self.util addCustomer];
}

- (IBAction)deleteCustomer:(id)sender {
    [self.util deleteCustomer];
}

- (IBAction)updateCustomer:(id)sender {
    [self.util updateCustmer];
}

- (IBAction)queryCustomer:(id)sender {
    [self.util queryCustomer];
}

- (IBAction)addOrder:(id)sender {
    [self.util addOrder];
}

- (IBAction)deleteOrder:(id)sender {
    [self.util deleteOrder];
}

- (IBAction)updateOrder:(id)sender {
    [self.util updateOrder];
}

- (IBAction)queryOrder:(id)sender {
    [self.util queryOrder];
}

- (IBAction)queryOrderByCustomer:(id)sender {
    [self.util queryOrderByCustomer];
}
@end
