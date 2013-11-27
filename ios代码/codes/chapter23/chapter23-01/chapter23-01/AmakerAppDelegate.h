//
//  AmakerAppDelegate.h
//  chapter23-01
//
//  Created by amaker on 3/7/13.
//  Copyright (c) 2013 amaker. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AmakerAppDelegate : UIResponder <UIApplicationDelegate>
@property (strong, nonatomic) UIWindow *window;
// 管理上下文
@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
// 管理对象模型
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
// 持久存储
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;
// 保存上下文
- (void)saveContext;
// 应用程序文档目录
- (NSURL *)applicationDocumentsDirectory;
@end
