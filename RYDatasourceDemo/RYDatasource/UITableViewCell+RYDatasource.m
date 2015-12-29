//
//  UITableViewCell+RYDatasource.m
//  RYDatasourceDemo
//
//  Created by Resory on 15/12/29.
//  Copyright © 2015年 Resory. All rights reserved.
//

#import "UITableViewCell+RYDatasource.h"

@implementation UITableViewCell (RYDatasource)

+ (UINib *)nib
{
    return [UINib nibWithNibName:NSStringFromClass([self class]) bundle:nil];
}

- (void)configCellWithEntity:(id)entity
{

}

@end
