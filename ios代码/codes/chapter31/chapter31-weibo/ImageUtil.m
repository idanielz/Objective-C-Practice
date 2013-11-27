//
//  ImageUtil.m
//  chapter31-weibo
//
//  Created by amaker on 5/8/13.
//  Copyright (c) 2013 amaker. All rights reserved.
//

#import "ImageUtil.h"
@implementation ImageUtil
+(UIImage*)scaleImage:(UIImage*)img andScale:(float)scale{
    // 缩小2倍
    UIImage *scaledImage =
    [UIImage imageWithCGImage:[img CGImage]
                        scale:(img.scale * scale)
                  orientation:(img.imageOrientation)];
    return scaledImage;
}
@end
