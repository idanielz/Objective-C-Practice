//
//  AppDelegate.h
//  todoListDemo
//
//  Created by DanielZ on 14-2-21.
//  Copyright (c) 2014年 DanielZ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MasterViewController.h"
#import "DetailViewController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

//上下文 CRUD
@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
//管理对象模型
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
//持久存储
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)saveContext;
//数据库位置
- (NSURL *)applicationDocumentsDirectory;

@property (nonatomic, strong) UISplitViewController *splitViewController;
@property (nonatomic, strong) MasterViewController *masterViewController;
@property (nonatomic, strong) DetailViewController *detailViewController;
@property (nonatomic, strong) UINavigationController *masterNavi;
@end
