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


@end


@interface WeatherInfoTableViewCell : BaseTableViewCell{
    WeatherInfoTableViewCellDataSource* dataSource;
}

@end
