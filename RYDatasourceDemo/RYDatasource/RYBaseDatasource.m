//
//  RSBaseDatasource.m
//  RYDatasourceDemo
//
//  Created by Resory on 15/12/29.
//  Copyright © 2015年 Resory. All rights reserved.
//

#import "RYBaseDatasource.h"

@implementation RYBaseDatasource

// 初始化
- (id)initWithServerData:(NSArray *)serverData
      andCellIdentifiers:(NSArray *)identifiers
{
    self = [super init];
    if(self)
    {
        self.serverData = serverData;
        self.cellIdentifiers = identifiers;
    }
    
    return self;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.serverData.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *identifier = self.cellIdentifiers[0];
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    
    return cell;
}

@end
