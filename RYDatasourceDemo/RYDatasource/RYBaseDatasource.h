//
//  RYBaseDatasource.h
//  RYDatasourceDemo
//
//  Created by billionsfinance-resory on 15/12/29.
//  Copyright © 2015年 Resory. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef void(^RYCellConfigBlock)(id cell, id entity);       // cell设置样式block
typedef void(^RYCellSelectedBlock)(id obj);                  // cell点击事件

@interface RYBaseDatasource : NSObject <UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, copy) NSArray *cellIdentifiers;
@property (nonatomic, copy) NSArray *serverData;
@property (nonatomic, copy) RYCellConfigBlock cellBlock;
@property (nonatomic, copy) RYCellSelectedBlock cellClickBlock;

/**
 *  初始化dataSource
 *
 *  @param serverData  服务器返回数据
 *  @param identifiers cell类型
 *  @param cellBlock   cell具体执行block
 *
 *  @return Datasource
 */
- (id)initWithServerData:(NSArray *)serverData
      andCellIdentifiers:(NSArray *)identifiers
      andCellConfigBlock:(RYCellConfigBlock)cellBlock;

@end