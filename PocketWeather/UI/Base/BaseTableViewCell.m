//
//  BaseTableViewCell.m
//  PocketWeather
//
//  Created by Vasyl Pastushenko on 4/2/16.
//  Copyright © 2016 Vasyl Pastushenko. All rights reserved.
//

#import "BaseTableViewCell.h"
// Data Source
@implementation BaseTableViewCellDataSource

- (id)init{
    self = [super init];
    if (self) {
    }
    return self;
}


+ (NSString*)reuseIdentifier{
    NSAssert(NO, @"Add uniq identifier");
    return @"";
}

+ (NSString*)nibName{
    NSAssert(NO, @"Add nibName identifier");
    return @"";
}
+ (float)height{
    NSAssert(NO, @"Add height");
    return 0;
}

@end


@implementation BaseTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}

@end
