//
//  ViewController.m
//  RYDatasourceDemo
//
//  Created by Resory on 15/12/29.
//  Copyright © 2015年 Resory. All rights reserved.
//

#import "ViewController.h"
#import "TDatasource.h"
#import "TCellOne.h"
#import "TModelOne.h"
#import "TCellTwo.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITableView *tableview;
@property (nonatomic, strong) NSMutableArray *serverData;       // 服务器返回的数据
@property (nonatomic, strong) NSMutableArray *cellIdentifiers;  // cell样式标示
@property (nonatomic, strong) TDatasource *datasource;          // 中间人

@end

@implementation ViewController

#pragma mark -
#pragma mark - View Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 初始化datasource
    [self configDataSource];
    
    // 初始化tableview
    [self configTableView];
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -
#pragma mark - Config Tableview
- (void)configTableView
{
    // 把_dataSource设置成_tableview的代理,以后所有代理方法都在_dataSource实现
    _tableview.delegate = _datasource;
    _tableview.dataSource = _datasource;
    _tableview.tableFooterView = [UIView new];
}

#pragma mark -
#pragma mark - Config DataSource

- (void)configDataSource
{
    // cell数据
    [self configData];
    
    // cell复用
    [self configIdentifier];
    
    __weak __typeof(self) weakSelf = self;
    
    // cell事件
    RYCellSelectedBlock cellSelectedBlock = ^(id obj){
        
        __strong __typeof(weakSelf) strongSelf = weakSelf;
        
        // cell点击事件
        [strongSelf cellSelectedWithObj:obj];
    };
    
    // 初始化dataSource
    _datasource = [[TDatasource alloc] initWithServerData:_serverData
                                       andCellIdentifiers:_cellIdentifiers];
    _datasource.cellSelectedBlock = cellSelectedBlock;
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

- (void)configIdentifier
{
    // cell复用设置
    _cellIdentifiers = [[NSMutableArray alloc] init];
    [_cellIdentifiers addObject:NSStringFromClass([TCellOne class])];
    [_tableview registerNib:[TCellOne nib] forCellReuseIdentifier:_cellIdentifiers[0]];
}

#pragma mark -
#pragma mark - Action
- (void)cellSelectedWithObj:(id)obj
{
    NSLog(@"%@",obj);
}

@end
