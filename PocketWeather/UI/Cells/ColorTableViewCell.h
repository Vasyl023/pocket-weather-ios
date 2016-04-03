//
//  ColorTableViewCell.h
//  PocketWeather
//
//  Created by Vasyl Pastushenko on 4/2/16.
//  Copyright © 2016 Vasyl Pastushenko. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseTableViewCell.h"

@interface ColorTableViewCellDataSource : BaseTableViewCellDataSource

- (id)initWithColor:(UIColor*)anColor
             height:(float)aHeight;


@end


@interface ColorTableViewCell : BaseTableViewCell{
    ColorTableViewCellDataSource* dataSource;
}

- (void)setData:(ColorTableViewCellDataSource*)aData;

@end
