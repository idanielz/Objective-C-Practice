//
//  Model.h
//  UpLookingVideoClient
//
//  Created by DanielZ on 14-2-22.
//  Copyright (c) 2014年 DanielZ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LoadingViewController.h"
#import "ASIFormDataRequest.h"
@interface Model : NSObject
@property (nonatomic, strong) LoadingViewController *loadVC;
- (NSString *)getTreeData;
- (NSString *)getPath:(NSString *)fileName;
- (void)saveTreeData:(NSString *)data;
- (ASIFormDataRequest *)buildTreeListRequest;
- (ASIFormDataRequest *)buildAllVideoRequest;
- (NSString *)getAllVideo;
- (void)saveAllVideo:(NSString *)data;
- (ASIFormDataRequest *)buildVideoDetailRequest:(int) vid;
@end
