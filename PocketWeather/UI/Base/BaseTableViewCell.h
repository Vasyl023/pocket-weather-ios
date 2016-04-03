//
//  BaseTableViewCell.h
//  PocketWeather
//
//  Created by Vasyl Pastushenko on 4/2/16.
//  Copyright © 2016 Vasyl Pastushenko. All rights reserved.
//

#import <UIKit/UIKit.h>



@interface BaseTableViewCellDataSource : NSObject

@property (assign, nonatomic) float height;
@property (strong, nonatomic) UIColor* backgroundWeatherColor;

+ (float)height;
+ (NSString*)reuseIdentifier;
+ (NSString*)nibName;

@end


@interface BaseTableViewCell : UITableViewCell

@property (strong, nonatomic) BaseTableViewCellDataSource* dataSource;

- (void)setData:(BaseTableViewCellDataSource*)aData;

@end
