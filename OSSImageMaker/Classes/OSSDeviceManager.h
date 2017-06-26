//
//  OSSDeviceManager.h
//  OSSTest
//
//  Created by GKiOS on 2017/6/14.
//  Copyright © 2017年 GKiOS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#ifndef OSS_SCREEN_W
#define OSS_SCREEN_W [UIScreen mainScreen].bounds.size.width
#endif

#ifndef OSS_SCREEN_H
#define OSS_SCREEN_H [UIScreen mainScreen].bounds.size.height
#endif


/* 这个类主要是为了, 转化物理屏幕的点到像素的转换
 * 比如 设计 设计的尺寸大小是 100 *150 大小的一个图片控件
 * 为了在 2x 和 3x 不同的屏幕上面显示不同分辨率的图片 我们可以通过这个类中的转换方法计算出
 * 在 2x 屏幕上面的 图片分辨率大小为 200 * 300
 * 在 3x 屏幕上面的 图片分辨率大小为 300 * 450
 *
 */


@interface OSSDeviceManager : NSObject


/**
 根据一个宽高比 计算出高度, 宽是屏幕宽
 
 根据屏幕的 2x 3x 属性 输出需要图片的高度

 @param scale 宽高比
 @return 返回一个高度
 */
+ (CGFloat)convertToScreenHeightByScale:(CGFloat)scale;


/**
 根据一个高度和宽高比, 计算出对应的高度
 根据屏幕的 2x 3x 属性 输出需要图片的高度
 @param height 高度
 @param scale 宽高比
 @return 计算出的宽度
 */
+ (CGFloat)convertToWidthByHeight:(CGFloat)height scale:(CGFloat)scale;


/**
 根据宽度和宽高比 计算出高度
 根据屏幕的 2x 3x 属性 输出需要图片的高度
 @param width 宽度
 @param scale 宽高比
 @return 计算出的高度
 */
+ (CGFloat)convertToHeightByWidth:(CGFloat)width scale:(CGFloat)scale;


/**
 把一个宽度转换为 对应分辨率的图片的高度

 @param width 宽度
 @return 转换后需要的分辨率高度
 */
+ (CGFloat)frameWidthPX:(CGFloat)width;



/**
 把一个高度转换为 对应的分辨率图片的 高度

 @param height 高度
 @return 转换后需要的分辨率高度
 */
+ (CGFloat)frameHeightPX:(CGFloat)height;




@end
