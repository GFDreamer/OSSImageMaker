//
//  OSSImageMaker.h
//  OSSTest
//
//  Created by GKiOS on 2017/6/14.
//  Copyright © 2017年 GKiOS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "OSSImageAttribute.h"
typedef void(^OSSImageMakerBlock) ();
@interface OSSImageMaker : NSObject
/** 缩放*/
@property(nonatomic, strong) OSSImageResizeAction   *resize;

/** 剪切 该功能暂未实现*/
@property(nonatomic, strong) NSString   *clip;

- (instancetype)initWithString:(NSString *)string;

@end
