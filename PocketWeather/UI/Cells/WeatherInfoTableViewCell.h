//
//  WeatherInfoTableViewCell.h
//  PocketWeather
//
//  Created by Vasyl Pastushenko on 4/2/16.
//  Copyright © 2016 Vasyl Pastushenko. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseTableViewCell.h"


@interface WeatherInfoTableViewCellDataSource : BaseTableViewCellDataSource

@property (strong, nonatomic) PocketWeather *weather;

- (id)initWithWeatherObject:(PocketWeather*)anID;

@end


@interface WeatherInfoTableViewCell : BaseTableViewCell{
    WeatherInfoTableViewCellDataSource* dataSource;
}
@property (weak, nonatomic) IBOutlet UILabel *temperatureLabel;
@property (weak, nonatomic) IBOutlet UILabel *weatherSloganLabel;
@property (weak, nonatomic) IBOutlet UILabel *cityLabel;
@property (weak, nonatomic) IBOutlet UILabel *weatherTimeLabel;
@property (weak, nonatomic) IBOutlet UIImageView *weatherIconImageView;

- (void)setData:(WeatherInfoTableViewCellDataSource*)aData;

@end
