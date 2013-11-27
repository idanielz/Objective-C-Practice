//
//  CodingTest.h
//  chapter16-01
//
//  Created by amaker on 4/15/13.
//  Copyright (c) 2013 amaker. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CodingTest : NSObject

-(void)writeString;
-(void)readString;

-(void)writeArray;
-(void)readArray;

-(void)writeDictionary;
-(void)readDictionary;

-(void)archive;
-(void)unarchive;

-(void)custom;

-(void)deepCopy;


@end
