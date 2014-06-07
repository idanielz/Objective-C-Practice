//
//  Model.m
//  UpLookingVideoClient
//
//  Created by DanielZ on 14-2-22.
//  Copyright (c) 2014年 DanielZ. All rights reserved.
//

#import "Model.h"
#import "ASIFormDataRequest.h"

@implementation Model

- (NSString *)getTreeData{
    NSString *path = [self getPath:@"treeList.plist"];
    NSString *content = [[NSString alloc]initWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
    return content;
}

- (void)saveTreeData:(NSString *)data
{
    BOOL result = [data writeToFile: [self getPath:@"treeList.plist"] atomically:YES encoding:NSUTF8StringEncoding error:nil];
    NSLog(@"result = %d",result);
}

- (NSString *)getPath:(NSString *)fileName
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *path = [paths objectAtIndex:0];
    path = [path stringByAppendingPathComponent:fileName];
    NSLog(@"Document Path = %@",path);
    return path;
}

- (ASIFormDataRequest *)buildTreeListRequest
{
    NSString *strUrl = @"http://www.uplook.cn/index.php?a=phone&m=index";
    NSURL *url = [NSURL URLWithString:strUrl];
    __weak ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:url];
    [request setPostValue:@"getTree" forKey:@"c"];
    return request;
}

- (ASIFormDataRequest *)buildAllVideoRequest
{
    NSString *strUrl = @"http://www.uplook.cn/index.php?a=phone&m=index";
    NSURL *url = [NSURL URLWithString:strUrl];
    __weak ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:url];
    [request setPostValue:@"getVideoList" forKey:@"c"];
    [request setPostValue:@"" forKey:@"treeid"];
    [request setPostValue:@"1" forKey:@"p"];
    return request;
}

- (ASIFormDataRequest *)buildVideoDetailRequest:(int) vid
{
    NSString *strUrl = @"http://www.uplook.cn/index.php?a=phone&m=index";
    NSURL *url = [NSURL URLWithString:strUrl];
    __weak ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:url];
    [request setPostValue:@"getVideo" forKey:@"c"];
    [request setPostValue:[NSNumber numberWithInt: vid] forKey:@"video_id"];
    return request;
}
- (void)saveAllVideo:(NSString *)data
{
    BOOL result = [data writeToFile: [self getPath:@"allVideo.plist"] atomically:YES encoding:NSUTF8StringEncoding error:nil];
    NSLog(@"result2 = %d",result);
}

- (NSString *)getAllVideo{
    NSString *path = [self getPath:@"allVideo.plist"];
    NSString *content = [[NSString alloc]initWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
    return content;
}
@end
