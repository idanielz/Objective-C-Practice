//
//  main.m
//  NSArrayTest
//
//  Created by DanielZ on 13-10-30.
//  Copyright (c) 2013年 DanielZ. All rights reserved.
//


#import <Foundation/Foundation.h>
int main(int argc, const char * argv[])
{
    @autoreleasepool {
        NSString *properString = [NSString stringWithContentsOfFile:@"/usr/share/dict/propernames"
                                                           encoding:NSUTF8StringEncoding
                                                              error:NULL];
        NSString *wordString = [NSString stringWithContentsOfFile:@"/usr/share/dict/words"
                                                         encoding:NSUTF8StringEncoding
                                                            error:NULL];
        
        NSArray *properArray = [properString componentsSeparatedByString:@"\n"];
        NSArray *wordArray = [wordString componentsSeparatedByString:@"\n"];
        
        for ( NSString *p in properArray )
        {
            for ( NSString *w in wordArray )
            {
                if ( [p caseInsensitiveCompare: w] == NSOrderedSame)
                {
                    NSLog(@"%@ %@", p, w);
                    NSString *p1 = [p stringByAppendingString:@" "];
                    NSString *p2 = [p1 stringByAppendingString:w];
                    NSString *p3 = [p2 stringByAppendingString:@"\n"];
                    NSData *pd = [ p3 dataUsingEncoding:NSUTF8StringEncoding];
                    NSFileHandle *file = [NSFileHandle fileHandleForWritingAtPath:@"/Users/zhangjidong/Downloads/test"];
                    [file seekToEndOfFile];
                    [file writeData:pd];
                    NSLog(@"%@ is in PROPERNAMES AND WORDS", p);
                    [file closeFile];
                    break;
                }
            }
        }
        
    }
    return 0;
}

