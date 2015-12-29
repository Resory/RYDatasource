//
//  RYBaseDatasource.h
//  RYDatasourceDemo
//
//  Created by Resory on 15/12/29.
//  Copyright © 2015年 Resory. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef void(^RYCellConfigBlock)(id cell, id entity);
typedef void(^RYCellSelectedBlock)(id obj);

@interface RYBaseDatasource : NSObject <UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, copy) NSArray *cellIdentifiers;             // cell样式选择
@property (nonatomic, copy) NSArray *serverData;                  // cell数据
@property (nonatomic, copy) RYCellConfigBlock cellBlock;          // cell设置样式block
@property (nonatomic, copy) RYCellSelectedBlock cellClickBlock;   // cell点击事件

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