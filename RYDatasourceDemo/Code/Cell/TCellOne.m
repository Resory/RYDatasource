//
//  TCellOne.m
//  RYDatasourceDemo
//
//  Created by billionsfinance-resory on 15/12/29.
//  Copyright © 2015年 Resory. All rights reserved.
//

#import "TCellOne.h"
#import "TModelOne.h"

@implementation TCellOne

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)configCellWithEntity:(id)entity
{
    if(entity)
    {
        TModelOne *model = entity;
        self.name.text = model.name;
        self.avartar.image = [UIImage imageNamed:model.imageName];
    }
}
@end
