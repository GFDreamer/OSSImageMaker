#ifdef __OBJC__
#import <UIKit/UIKit.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

#import "NSString+OSSAdditons.h"
#import "OSSDeviceManager.h"
#import "OSSImageAttribute.h"
#import "OSSImageMaker.h"
#import "OSSImageTool.h"

FOUNDATION_EXPORT double OSSImageMakerVersionNumber;
FOUNDATION_EXPORT const unsigned char OSSImageMakerVersionString[];

