//
//  WeatherColor.h
//  PocketWeather
//
//  Created by Vasyl Pastushenko on 4/3/16.
//  Copyright © 2016 Vasyl Pastushenko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface WeatherColor : NSObject

@property (strong,nonatomic) NSString* weatherID;

@property  float red;
@property  float green;
@property  float blue;


- (id)initWithWeathearId:(NSString*)aWeatherId;

- (UIColor *)getColor;

- (void)updateColorWithStep:(float)aStep;

@end
