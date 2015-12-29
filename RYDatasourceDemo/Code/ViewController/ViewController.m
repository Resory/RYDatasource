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
#import "TModelOne.h"
#import "TCellTwo.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITableView *tableview;
@property (nonatomic, strong) NSMutableArray *serverData;   // 服务器返回的数据
@property (nonatomic, strong) TDatasource *dataSource;

@end

@implementation ViewController

#pragma mark -
#pragma mark - View Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self configData];
    
    [self configTableView];
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)configData
{
    // 服务器返回的数据
    _serverData = [[NSMutableArray alloc] init];
    // 实体设置
    TModelOne *one = [[TModelOne alloc] init];
    TModelOne *two = [[TModelOne alloc] init];
    
    one.name = @"奇犽";
    one.imageName = @"001.jpg";
    
    two.name = @"拿尼加";
    two.imageName = @"002.jgp";
    
    [_serverData addObject:one];
    [_serverData addObject:two];
}

#pragma mark -
#pragma mark - Config
- (void)configTableView
{
    _tableview.tableFooterView = [UIView new];
    
    // cell类型(用具体的cell class来做唯一标示)
    NSArray *cellIdentifiers = @[NSStringFromClass([TCellOne class])];
    [_tableview registerNib:[TCellOne nib] forCellReuseIdentifier:cellIdentifiers[0]];
    
    // cell的样式在block中配置
    RSCellConfigBlock configBlock = ^(UITableViewCell *cell , id entity)
    {
        [cell configCellWithEntity:entity];
    };
    
    // cell点击事件
    RSCellClickBlock cellClickBlock = ^(id obj)
    {
        [self cellClickActionWithObj:obj];
    };
    
    // 初始化_dataSource
    _dataSource = [[TDatasource alloc] initWithServerData:_serverData
                                       andCellIdentifiers:cellIdentifiers
                                       andCellConfigBlock:configBlock];
    _dataSource.cellClickBlock = cellClickBlock;
    
    // 把_dataSource设置成_tableview的代理,以后所有代理方法都在_dataSource实现
    _tableview.delegate = _dataSource;
    _tableview.dataSource = _dataSource;
}

#pragma mark -
#pragma mark - Action
- (void)cellClickActionWithObj:(id)obj
{
    NSLog(@"%@",obj);
}

@end
