//
//  OSSImageAttribute.h
//  OSSTest
//
//  Created by GKiOS on 2017/6/14.
//  Copyright © 2017年 GKiOS. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, OSSImageResizeContentModelType) {
    OSSImageResizeContentModelTypeLift,
    OSSImageResizeContentModelTypeMfit,
    OSSImageResizeContentModelTypePad,
    OSSImageResizeContentModelTypeFixed,
    OSSImageResizeContentModelTypeFill
};


@interface OSSImageResizeAction : NSObject

typedef OSSImageResizeAction *(^Action) (NSNumber *attribute);

- (instancetype)initWithString:(NSString *)string;


/** 图片的填充模式*/
@property(nonatomic, strong) Action   contentModel;

/** 指定宽度*/
@property(nonatomic, strong) Action   width;

/** 指定高度*/
@property(nonatomic, strong) Action   height;

/** 指定当目标缩略图大于原图时是否处理。值是 1 表示不处理；值是 0 表示处理*/
@property(nonatomic, strong) Action   limit;

/** 等比缩放*/
@property(nonatomic, strong) Action   equalRatioScale;




/** 宽高比 屏幕宽 根据传入的比例依据屏幕宽计算高度  高度
 * screenWidthToHeightScale  = ScreenWidth * 1.0 / ScreenHeight
 * e.g
 */
@property(nonatomic, strong) Action   screenWidthToHeightScale;

/** 普通宽高比  根据指定宽和指定比例计算设置高度 比例 =  width / height 
 * 限制条件 必须 先配置 width的大小
 */
@property(nonatomic, strong) Action   widthToHeightScale;

/** 普通宽高比  根据指定高和指定比例计算设置宽度 width / height
 * 限制条件 必须先 配置 height的大小;
 */
@property(nonatomic, strong) Action   heightToWidthScale;

/** 最终结果值*/
@property(nonatomic, strong) NSString   *resultString;

@end



@interface OSSImageAttribute : NSObject



@end
