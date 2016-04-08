//
//  WeatherColor.h
//  PocketWeather
//
//  Created by Vasyl Pastushenko on 4/3/16.
//  Copyright © 2016 Vasyl Pastushenko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface WeatherStyle : NSObject

@property (strong,nonatomic) NSString* weatherID;

@property  float red;
@property  float green;
@property  float blue;
@property (strong, nonatomic) NSString* iconName;

- (id)initWithWeathearId:(NSString*)aWeatherId;

- (UIColor *)getColor;

- (UIImage *)getImage;

- (void)updateColorWithStep:(float)aStep;

@end
