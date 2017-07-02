//
//  LGExampleTableViewController.m
//  OSSImageMaker
//
//  Created by Simple on 2017/7/2.
//  Copyright © 2017年 LDreame. All rights reserved.
//

#import "LGExampleTableViewController.h"
#import "LGResizeExampleViewController.h"
static NSString *cellID = @"example.cell.id";
@interface LGExampleTableViewController ()
@property(nonatomic, strong) NSMutableArray *dataArray;
@end

@implementation LGExampleTableViewController

- (instancetype)init
{
    self = [super initWithStyle:UITableViewStylePlain];
    if (self) {
        
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:cellID];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
    
    cell.textLabel.text = self.dataArray[indexPath.row];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    LGResizeExampleViewController *resizeVC = [[LGResizeExampleViewController alloc] init];
    [self.navigationController pushViewController:resizeVC animated:YES];
}


#pragma mark - getter

- (NSMutableArray *)dataArray
{
    if (_dataArray == nil) {
        _dataArray = [@[@"图片缩放"] mutableCopy];
    }
    return _dataArray;
}

@end
