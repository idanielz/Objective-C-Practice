//
//  AmakerAppDelegate.h
//  chapter22-02
//
//  Created by amaker on 3/8/13.
//  Copyright (c) 2013 amaker. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AmakerViewController;

@interface AmakerAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) AmakerViewController *viewController;

@property(strong,nonatomic)UINavigationController *navi;

@end
