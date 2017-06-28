//
//  OSSImageAttribute.m
//  OSSTest
//
//  Created by GKiOS on 2017/6/14.
//  Copyright © 2017年 GKiOS. All rights reserved.
//

#import "OSSImageAttribute.h"
#import <objc/runtime.h>
#import <UIKit/UIKit.h>
#import "OSSDeviceManager.h"
static NSString *const oss_w = @"w_";
static NSString *const oss_h = @"h_";
static NSString *const oss_p = @"p_";
static NSString *const oss_limit = @"limit_";
static NSString *const oss_color = @"color_";
static NSString *const oss_mfit = @"m_mfit";
static NSString *const oss_lift = @"m_lift";
static NSString *const oss_fill = @"m_fill";
static NSString *const oss_pad = @"m_pad";
static NSString *const oss_fixed = @"m_fixed";

@interface OSSImageResizeAction ()
@property(nonatomic, copy) NSString   *baseString;
@property(nonatomic, assign) OSSImageResizeContentModelType   imageContentModelType;
@property(nonatomic, copy) NSNumber   *oss_w;
@property(nonatomic, copy) NSNumber   *oss_h;
@property(nonatomic, copy) NSNumber   *oss_p;
@property(nonatomic, copy) NSNumber   *oss_limit;

@end


@implementation OSSImageResizeAction

- (instancetype)initWithString:(NSString *)string
{
    self = [super init];
    if (self) {
        self.baseString = string;
    }
    return self;
}

- (void)addOSSImageAttributeValue:(NSString *)atrri type:(NSString *)type
{
    NSString *tem = [NSString stringWithFormat:@",%@%@", type, atrri];
    self.baseString = [self.baseString stringByAppendingString:tem];
    
}

- (Action)contentModel
{
    return ^(NSNumber *attribute) {
        self.imageContentModelType  = attribute.integerValue;
        [self addOSSImageAttributeValue:@"" type:[self currentImageContentModelDescription]];
        return self;
    };
}

- (Action)width
{
    return ^(NSNumber *attribute) {
        NSAssert((attribute.floatValue >= 1.0 && attribute.floatValue <= 4096), @"宽度范围 1~4096");
        CGFloat w_f = [OSSDeviceManager frameWidthPX:attribute.floatValue];
        self.oss_w = [NSNumber numberWithFloat:w_f];
        [self addOSSImageAttributeValue:self.oss_w.stringValue type:oss_w];
        return self;
    };
}

- (Action)height
{
    return ^(NSNumber *attribute) {
        NSAssert((attribute.floatValue >= 1.0 && attribute.floatValue <= 4096), @"高度范围 1~4096");
        CGFloat h_f = [OSSDeviceManager frameHeightPX:attribute.floatValue];
        self.oss_h = [NSNumber numberWithFloat:h_f];
        [self addOSSImageAttributeValue:self.oss_h.stringValue type:oss_h];
        return self;
    };
}

- (Action)limit
{
    return ^(NSNumber *attribute) {
        NSAssert((attribute.floatValue == 0.0 || attribute.floatValue == 1.0), @"limit 只能是 1和0");
        self.oss_limit = attribute;
        [self addOSSImageAttributeValue:attribute.stringValue type:oss_limit];
        return self;
    };
}

- (Action)equalRatioScale
{
    return ^(NSNumber *attribute) {
        NSAssert((attribute.floatValue >= 1.0 && attribute.floatValue <= 1000.0), @"倍数百分比。 小于100，即是缩小，大于100即是放大 不能超过范围");
        [self addOSSImageAttributeValue:attribute.stringValue type:oss_limit];
        return self;
    };
}

- (Action)screenWidthToHeightScale
{
    return ^(NSNumber *attribute) {
        CGFloat result = [OSSDeviceManager convertToScreenHeightByScale:attribute.floatValue];
        
        NSAssert((result >= 1.0 && result <= 4096), @"放大比例过大, 超过4096的最大限制");
        
        CGFloat kSW = OSS_SCREEN_W;
        CGFloat w_f = [OSSDeviceManager frameWidthPX:kSW];
        self.oss_w = [NSNumber numberWithFloat:w_f];
        [self addOSSImageAttributeValue:self.oss_w.stringValue type:oss_w];
        self.oss_h = @(result);
        [self addOSSImageAttributeValue:self.oss_h.stringValue type:oss_h];
        return self;
    };
}

- (Action)widthToHeightScale
{
    return ^(NSNumber *attribute) {
        NSAssert(self.oss_w, @"使用widthToHeightScale, 必须先调用width,配置width的高度");
        CGFloat result = [OSSDeviceManager convertToHeightByWidth:self.oss_w.floatValue scale:attribute.floatValue];
        
        NSAssert((result >= 1.0 && result <= 4096), @"放大比例过大, 超过4096的最大限制");
        [self addOSSImageAttributeValue:@(result).stringValue type:oss_h];
        self.oss_h = @(result);
        return self;
    };
}

- (Action)heightToWidthScale
{
    return ^(NSNumber *attribute) {
        NSAssert(self.oss_h, @"使用heightToWidthScale, 必须先调用height,配置height的高度");
        CGFloat result = [OSSDeviceManager convertToWidthByHeight:self.oss_h.floatValue scale:attribute.floatValue ];
        NSAssert((result >= 1.0 && result <= 4096), @"放大比例过大, 超过4096的最大限制");
        [self addOSSImageAttributeValue:@(result).stringValue type:oss_w];
        self.oss_w = @(result);
        return self;
    };
}

- (NSString *)resultString
{
    return self.baseString;
}

#pragma mark - OSSImageContentModel 转字符串

- (NSString *)currentImageContentModelDescription
{
    NSString *result = nil;
    switch (self.imageContentModelType) {
        case OSSImageResizeContentModelTypeMfit:
            result = oss_mfit;
            break;
        case OSSImageResizeContentModelTypeLift:
            result = oss_lift;
            break;
        case OSSImageResizeContentModelTypeFixed:
            result = oss_fixed;
            break;
        case OSSImageResizeContentModelTypePad:
            result = oss_pad;
            break;
        case OSSImageResizeContentModelTypeFill:
            result = oss_fill;
            break;
        default:
            result = @"";
            break;
    }
    
    return result;
}


@end


@implementation OSSImageAttribute

@end
