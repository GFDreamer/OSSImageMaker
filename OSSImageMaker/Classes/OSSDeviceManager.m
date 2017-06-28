//
//  OSSDeviceManager.m
//  OSSTest
//
//  Created by GKiOS on 2017/6/14.
//  Copyright © 2017年 GKiOS. All rights reserved.
//

#import "OSSDeviceManager.h"

@implementation OSSDeviceManager

+ (CGFloat)screenScale
{
    return [UIScreen mainScreen].scale;
}

+ (CGFloat)convertToScreenHeightByScale:(CGFloat)scale
{
    return OSS_SCREEN_W / scale * [self screenScale];
}

+ (CGFloat)convertToWidthByHeight:(CGFloat)height scale:(CGFloat)scale
{
    return height *scale;
}

+ (CGFloat)convertToHeightByWidth:(CGFloat)width scale:(CGFloat)scale
{
    return width / scale;
}

+ (CGFloat)frameWidthPX:(CGFloat)width
{
    return width *[self screenScale];
}

+ (CGFloat)frameHeightPX:(CGFloat)height
{
    return height *[self screenScale];
}

@end
