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

- (id)initWithColor:(UIColor*)anColor
             height:(float)aHeight{
    self = [super init];
    if (self) {
        self.backgroundWeatherColor = anColor;
        self.height = aHeight;
    }
    return self;

}

@end

@implementation ColorTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setData:(ColorTableViewCellDataSource*)aData{
    self.dataSource = aData;
    [self layoutSubviews];
}

- (void)layoutSubviews{
    [super layoutSubviews];
    self.backgroundColor = self.dataSource.backgroundWeatherColor;
    [self.contentView layoutIfNeeded];

}


@end
