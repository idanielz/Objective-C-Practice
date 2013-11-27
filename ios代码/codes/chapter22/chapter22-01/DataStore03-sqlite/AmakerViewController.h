//
//  AmakerViewController.h
//  DataStore03-sqlite
//
//  Created by Mahmood1 on 10/26/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DbUtil.h"

@interface AmakerViewController : UIViewController
{
    DbUtil *util;
}
- (IBAction)create:(id)sender;
- (IBAction)insert:(id)sender;
- (IBAction)delete2:(id)sender;
- (IBAction)update:(id)sender;
- (IBAction)query:(id)sender;

@end
