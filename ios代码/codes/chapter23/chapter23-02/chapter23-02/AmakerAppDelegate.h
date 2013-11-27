//
//  AmakerAppDelegate.h
//  chapter23-02
//
//  Created by amaker on 3/7/13.
//  Copyright (c) 2013 amaker. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "AmakerRootViewController.h"

@interface AmakerAppDelegate : UIResponder <UIApplicationDelegate>
@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

@property(strong,nonatomic) AmakerRootViewController *root;


- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

@end
