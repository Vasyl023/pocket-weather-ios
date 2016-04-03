//
//  WeatherInfoTableViewCell.m
//  PocketWeather
//
//  Created by Vasyl Pastushenko on 4/2/16.
//  Copyright © 2016 Vasyl Pastushenko. All rights reserved.
//

#import "WeatherInfoTableViewCell.h"

@implementation WeatherInfoTableViewCellDataSource

- (id)init{
    self = [super init];
    return self;
}

- (id)initWithWeatherId:(NSString*)anID{
    self = [super init];
    if (self) {
        self.backgroundWeatherColor = [[[WeatherColor alloc] initWithWeathearId:anID] getColor];
    }
    return self;
}

+ (NSString*)reuseIdentifier{
    return @"weather_info_uniq_cell";
}

+ (NSString*)nibName{
    return @"WeatherInfoTableViewCell";
}

+ (float)height{
    return WEATHER_MAIN_TABLE_CELL_HEIGHT;
}

@end


@implementation WeatherInfoTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.selectionStyle = UITableViewCellSelectionStyleNone;

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

- (void)setData:(WeatherInfoTableViewCellDataSource*)aData{
    self.dataSource = aData;
    [self layoutSubviews];

}

- (void)layoutSubviews{
    [super layoutSubviews];
    [self.contentView layoutIfNeeded];

    self.backgroundColor = self.dataSource.backgroundWeatherColor;
}
@end
