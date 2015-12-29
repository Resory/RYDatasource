//
//  ViewController.m
//  RYDatasourceDemo
//
//  Created by billionsfinance-resory on 15/12/29.
//  Copyright © 2015年 Resory. All rights reserved.
//

#import "ViewController.h"
#import "TDatasource.h"
#import "TCellOne.h"
#import "TCellTwo.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITableView *tableview;
@property (nonatomic, strong) NSArray *serverData;
@property (nonatomic, strong) TDatasource *dataSource;

@end

@implementation ViewController

#pragma mark -
#pragma mark - View Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self configTableView];
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -
#pragma mark - Config
- (void)configTableView
{
    // 具体服务器返回数据
    _serverData = @[@"张三",@"李四",@"王五",@"赵六"];
    
    // cell类型(用具体的cell class来做唯一标示)
    NSArray *cellIdentifier = @[NSStringFromClass([TCellOne class]),
                                NSStringFromClass([TCellTwo class])];
    
    // 这里block暂时为空.
    RSCellConfigBlock cellblock = nil;
    
    // 初始化_dataSource
    _dataSource = [[TDatasource alloc] initWithServerData:_serverData
                                       andCellIdentifiers:cellIdentifier
                                       andCellConfigBlock:cellblock];
    
    // 把_dataSource设置成_tableview的代理,以后所有代理方法都在_dataSource实现
    _tableview.delegate = _dataSource;
    _tableview.dataSource = _dataSource;
    
    // cell的复用
    UINib *nib = [UINib nibWithNibName:NSStringFromClass([llDetailCell class]) bundle:nil];
    [_tableview registerNib:nib forCellReuseIdentifier:cellIdentifier[0]];
}

@end
