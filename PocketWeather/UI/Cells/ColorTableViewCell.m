//
//  ColorTableViewCell.m
//  PocketWeather
//
//  Created by Vasyl Pastushenko on 4/2/16.
//  Copyright © 2016 Vasyl Pastushenko. All rights reserved.
//

#import "ColorTableViewCell.h"
#import <SDWebImage/UIImageView+WebCache.h>

@implementation ColorTableViewCellDataSource

+ (NSString*)reuseIdentifier{
    return @"color_info_uniq_cell";
}

+ (NSString*)nibName{
    return @"ColorTableViewCell";
}

- (id)initWithColor:(UIColor*)anColor
             height:(float)aHeight
              audio:(Music *)anAudio{
    self = [super init];
    if (self) {
        self.backgroundWeatherColor = anColor;
        self.height = aHeight;
        self.audio = anAudio;
    }
    return self;

}

@end

@implementation ColorTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.
    self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setData:(ColorTableViewCellDataSource*)aData{
    self.dataSource = aData;
    self.backgroundColor = self.dataSource.backgroundWeatherColor;
    
    [self.coverImageView sd_setImageWithURL:[NSURL URLWithString:aData.audio.coverPictureURL]
                           placeholderImage:[UIImage imageNamed:@"sun"]];
    
    
    self.audioNameLabel.text = [NSString stringWithFormat:@"%@ - %@", aData.audio.artist, aData.audio.title];
    

    [self layoutSubviews];
}

- (void)layoutSubviews{
    [super layoutSubviews];
    [self.contentView layoutIfNeeded];

}


@end
