//
//  NSString+OSSAdditons.m
//  OSSTest
//
//  Created by GKiOS on 2017/6/14.
//  Copyright © 2017年 GKiOS. All rights reserved.
//

#import "NSString+OSSAdditons.h"
#import <objc/runtime.h>

static char makerName ;
@implementation NSString (OSSAdditons)

- (OSSImageMaker *)maker
{
    if (!objc_getAssociatedObject(self, &makerName)) {
        OSSImageMaker  *maker = [[OSSImageMaker alloc] initWithString:self];
        objc_setAssociatedObject(self, &makerName, maker, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return objc_getAssociatedObject(self, &makerName);
}



@end
