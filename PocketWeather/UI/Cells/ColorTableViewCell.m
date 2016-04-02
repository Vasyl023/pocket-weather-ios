//
//  ColorTableViewCell.m
//  PocketWeather
//
//  Created by Vasyl Pastushenko on 4/2/16.
//  Copyright © 2016 Vasyl Pastushenko. All rights reserved.
//

#import "ColorTableViewCell.h"

@implementation ColorTableViewCellDataSource

+ (NSString*)reuseIdentifier{
    return @"color_info_uniq_cell";
}

+ (NSString*)nibName{
    return @"ColorTableViewCell";
}

+ (float)height{
    return COLOR_TABLE_CELL_HEIGHT;
}

@end

@implementation ColorTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.backgroundColor = [UIColor orangeColor];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
