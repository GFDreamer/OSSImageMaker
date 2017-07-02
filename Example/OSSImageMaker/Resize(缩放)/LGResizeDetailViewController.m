//
//  LGResizeDetailViewController.m
//  OSSImageMaker
//
//  Created by Simple on 2017/7/2.
//  Copyright © 2017年 LDreame. All rights reserved.
//

#import "LGResizeDetailViewController.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import <Masonry/Masonry.h>
@interface LGResizeDetailViewController ()
@property(nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UIImageView *imageView;

@property(nonatomic, strong) UILabel *urlLabel;
@end

@implementation LGResizeDetailViewController

- (instancetype)initWithImageUrl:(NSString *)imageUrl
{
    self = [super init];
    if (self) {
        self.urlLabel.text = imageUrl;
        [self.view addSubview:self.scrollView];
        [self.scrollView addSubview:self.imageView];
        [self.view addSubview:self.urlLabel];
        [self createConstraints];
        [self.imageView sd_setImageWithURL:[NSURL URLWithString:imageUrl]];
    }
    return self;
}

- (void)createConstraints
{
    [self.scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
        make.width.equalTo(self.view);
    }];
    
    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.centerY.equalTo(self.scrollView);
    }];
    
    [self.urlLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.top.equalTo(self.view).offset(120);
    }];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor lightGrayColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - getter

- (UIScrollView *)scrollView
{
    if (_scrollView == nil) {
        _scrollView = [[UIScrollView alloc] init];
    }
    return _scrollView;
}

- (UIImageView *)imageView
{
    if (_imageView == nil) {
        _imageView = [[UIImageView alloc] init];
        _imageView.backgroundColor = [UIColor whiteColor];
    }
    return _imageView;
}

- (UILabel *)urlLabel
{
    if (_urlLabel == nil) {
        _urlLabel = [[UILabel alloc] init];
        _urlLabel.textColor = [UIColor blueColor];
        _urlLabel.numberOfLines = 0;
    }
    return _urlLabel;
}




@end
