//
//  OSSImageMaker.m
//  OSSTest
//
//  Created by GKiOS on 2017/6/14.
//  Copyright © 2017年 GKiOS. All rights reserved.
//

#import "OSSImageMaker.h"

@interface OSSImageMaker ()

@property(nonatomic, copy) NSString   *baseString;

@end

@implementation OSSImageMaker

- (instancetype)initWithString:(NSString *)string
{
    self = [super init];
    if (self) {
        self.baseString = [NSString stringWithFormat:@"%@?x-oss-process=image", string];
    }
    return self;
}


- (OSSImageResizeAction *)resize
{
    NSString *actionString = [self.baseString stringByAppendingString:@"/resize"];
    OSSImageResizeAction *action = [[OSSImageResizeAction alloc] initWithString:actionString];
    
    return action;
}


@end
