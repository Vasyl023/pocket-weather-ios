//
//  ColorTableViewCell.h
//  PocketWeather
//
//  Created by Vasyl Pastushenko on 4/2/16.
//  Copyright © 2016 Vasyl Pastushenko. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseTableViewCell.h"
#import "Music.h"

@interface ColorTableViewCellDataSource : BaseTableViewCellDataSource

@property (strong, nonatomic) Music *audio;

- (id)initWithColor:(UIColor*)anColor
             height:(float)aHeight
              audio:(Music*)anAudio;


@end


@interface ColorTableViewCell : BaseTableViewCell{
    ColorTableViewCellDataSource* dataSource;
}
@property (weak, nonatomic) IBOutlet UIImageView *coverImageView;
@property (weak, nonatomic) IBOutlet UILabel *audioNameLabel;

- (void)setData:(ColorTableViewCellDataSource*)aData;

@end
