//
//  LGViewController.m
//  OSSImageMaker
//
//  Created by LDreame on 06/26/2017.
//  Copyright (c) 2017 LDreame. All rights reserved.
//

#import "LGViewController.h"
#import <Masonry/Masonry.h>
#import <SDWebImage/UIImageView+WebCache.h>
#import <OSSImageMaker/OSSImageTool.h>
@interface LGViewController ()

@end

@interface LGViewController ()
@property(nonatomic, strong) UIImageView   *imageView;
@end

@implementation LGViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
    self.imageView  = [[UIImageView alloc] init];
    self.imageView.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.imageView];
    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.height.greaterThanOrEqualTo(@0);
        make.centerX.centerY.equalTo(self.view);
    }];
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    NSString *url = @"http://jyjf-test.oss-cn-hangzhou.aliyuncs.com/cms/201706/1a63a8cf9a5043999b53df72fdafc124.png";
    static int count = 1;
    NSString *str = url.maker.resize.width(@(100 *count)).height(@(200 * count)).contentModel(@(OSSImageResizeContentModelTypePad)).limit(@0).resultString;
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:str]];
    count = count + 1;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
