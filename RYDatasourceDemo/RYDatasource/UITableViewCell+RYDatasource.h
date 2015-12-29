//
//  UITableViewCell+RYDatasource.h
//  RYDatasourceDemo
//
//  Created by Resory on 15/12/29.
//  Copyright © 2015年 Resory. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableViewCell (RYDatasource)

/**
 *  返回nib
 *
 *  @return 返回nib
 */
+ (UINib *)nib;


/**
 *  根据实体,设置cell样式
 *
 *  @param entity 实体
 */
- (void)configCellWithEntity:(id)entity;

@end
