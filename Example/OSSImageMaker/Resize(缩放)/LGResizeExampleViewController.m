//
//  LGResizeExampleViewController.m
//  OSSImageMaker
//
//  Created by Simple on 2017/7/2.
//  Copyright © 2017年 LDreame. All rights reserved.
//

#import "LGResizeExampleViewController.h"
#import <OSSImageMaker/OSSImageTool.h>
#import "LGResizeDetailViewController.h"
@interface LGResizeExampleViewController ()

@end

@implementation LGResizeExampleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.view.backgroundColor = [UIColor whiteColor];
    //@"http://jyjf-test.oss-cn-hangzhou.aliyuncs.com/cms/201706/1a63a8cf9a5043999b53df72fdafc124.png";
    //这是一张图片宽度 1125 高度 375 的 @3x 的png 图片放在 OSS上面
}

// 单边缩放
- (IBAction)button1:(id)sender {
    //将图缩略成高度为100，宽度按比例处理。
    //因为OSSImageMaker 内置转换了 2x 和3x 所以图片的质量转换后 2x 高度200px 2x 高度 300px
    NSString *str = @"http://jyjf-test.oss-cn-hangzhou.aliyuncs.com/cms/201706/1a63a8cf9a5043999b53df72fdafc124.png";
    NSString *oss_url = str.maker.resize.width(@100).resultString;
    [self pushWithUrl:oss_url];
    
    
}

//强制宽高缩略
- (IBAction)button2:(id)sender {
    //强制缩略宽高 contentModel 为 fiexd
    // frame 宽高 100 则 2x和3x 分别为 200 和 300px
    NSString *str = @"http://jyjf-test.oss-cn-hangzhou.aliyuncs.com/cms/201706/1a63a8cf9a5043999b53df72fdafc124.png";
    NSString *oss_url = str.maker.resize.width(@100).height(@100).contentModel(@(OSSImageResizeContentModelTypeFixed)).resultString;
    [self pushWithUrl:oss_url];
}

//等比缩放, 限定在矩形框内
- (IBAction)button3:(id)sender {
    
    //将图缩略成宽度为100，高度为100，按长边优先 contentModel 为lift
    // frame 宽高 100 则 2x和3x 分别为 200 和 300px
    
    NSString *str = @"http://jyjf-test.oss-cn-hangzhou.aliyuncs.com/cms/201706/1a63a8cf9a5043999b53df72fdafc124.png";
    NSString *oss_url = str.maker.resize.width(@100).height(@100).contentModel(@(OSSImageResizeContentModelTypeLfit)).resultString;
    [self pushWithUrl:oss_url];
}


//等比缩放, 限定在矩形框内 短边优先
- (IBAction)button4:(id)sender {
    //将图缩略成宽度为100，高度为100，短边优先 contentModel 为mfit
    // frame 宽高 100 则 2x和3x 分别为 200 和 300px
    NSString *str = @"http://jyjf-test.oss-cn-hangzhou.aliyuncs.com/cms/201706/1a63a8cf9a5043999b53df72fdafc124.png";
    NSString *oss_url = str.maker.resize.width(@100).height(@100).contentModel(@(OSSImageResizeContentModelTypeMfit)).resultString;
    [self pushWithUrl:oss_url];

    
}

// 固定宽高，自动裁剪
- (IBAction)button5:(id)sender {
    //将图缩略成宽度为100，高度为100，contentModel 为fill
    // frame 宽高 100 则 2x和3x 分别为 200 和 300px
    
    NSString *str = @"http://jyjf-test.oss-cn-hangzhou.aliyuncs.com/cms/201706/1a63a8cf9a5043999b53df72fdafc124.png";
    NSString *oss_url = str.maker.resize.width(@100).height(@100).contentModel(@(OSSImageResizeContentModelTypeFill)).resultString;
    [self pushWithUrl:oss_url];
    
}

//缩略填充
- (IBAction)button6:(id)sender {
    
    //将图按短边缩略到100x100, 然后按红色填充 contentModel pad 模式
    // frame 宽高 100 则 2x和3x 分别为 200 和 300px
    NSString *str = @"http://jyjf-test.oss-cn-hangzhou.aliyuncs.com/cms/201706/1a63a8cf9a5043999b53df72fdafc124.png";
    NSString *oss_url = str.maker.resize.width(@100).height(@100).contentModel(@(OSSImageResizeContentModelTypePad)).color(@"ff0000").resultString;
    [self pushWithUrl:oss_url];
}

//按比例缩略
- (IBAction)button7:(id)sender {
    NSString *str = @"http://jyjf-test.oss-cn-hangzhou.aliyuncs.com/cms/201706/1a63a8cf9a5043999b53df72fdafc124.png";
    NSString *oss_url = str.maker.resize.equalRatioScale(@10).resultString;
    [self pushWithUrl:oss_url];
}

- (void)pushWithUrl:(NSString *)url
{
     NSLog(@"oss_url======%@", url);
    LGResizeDetailViewController *detailVC = [[LGResizeDetailViewController alloc] initWithImageUrl:url];
    [self.navigationController pushViewController:detailVC animated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
