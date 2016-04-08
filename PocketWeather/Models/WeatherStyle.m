//
//  WeatherColor.m
//  PocketWeather
//
//  Created by Vasyl Pastushenko on 4/3/16.
//  Copyright © 2016 Vasyl Pastushenko. All rights reserved.
//

#import "WeatherStyle.h"

@implementation WeatherStyle

- (id)initWithWeathearId:(NSString*)aWeatherId{
    if(self = [super init]){
        self.weatherID = aWeatherId;
        [self initColor];
        [self initIcon];
    }
    return self;
}

- (UIColor*)getColor{
    return [UIColor colorWithRed:self.red / 255.0
                           green:self.green / 255.0
                            blue:self.blue / 255.0
                           alpha:1];
}

- (UIImage*)getImage{

    return [UIImage imageNamed:self.iconName];
    
}
// Changing colour with step, see step size in defines
- (void)updateColorWithStep:(float)aStep{
    
    if(aStep <= self.red)
        self.red -= aStep;
    else
        self.red += aStep;

    if(aStep <= self.green)
        self.green -= aStep;
    else
        self.green += aStep;
    
    if(aStep <= self.blue)
        self.blue -= aStep;
    else
        self.blue += aStep;

    
}
// 1: Clear
// 2: Thunderstorm
// 3: Drizzle
// 5: Rain
// 6: Snow
// 7: Atmosphere
// 8: Clouds
// 9: Extreme

- (void)initIcon{
    // Hardcoded values by default
    self.iconName = @"sun";
    NSLog(@"%@",self.weatherID);
    // Ugly selector by weather id from API
    if([self.weatherID isEqualToString:@"1"]){
        self.iconName = @"sun";
    }
    
    if([self.weatherID isEqualToString:@"2"]){
        self.iconName = @"thunderstorm";
    }
    
    if([self.weatherID isEqualToString:@"3"]){
        self.iconName = @"drizzle";
    }    
    
    if([self.weatherID isEqualToString:@"5"]){
        self.iconName = @"rain";
    }
    
    
    if([self.weatherID isEqualToString:@"7"]){
        self.iconName = @"cloud-sun";
    }
    
    
    if([self.weatherID isEqualToString:@"8"]){
        self.iconName = @"cloudy";
    }
    
    if([self.weatherID isEqualToString:@"9"]){
        self.iconName = @"thunderstorm";
    }
}

- (void)initColor{
    // Hardcoded values by default
    self.red = 255.0;
    self.green = 107.0;
    self.blue = 0;

    // Ugly selector by weather id from API
    if([self.weatherID isEqualToString:@"1"]){
        self.red = 255.0;
        self.green = 107.0;
        self.blue = 0;
    }

    if([self.weatherID isEqualToString:@"2"]){
        self.red = 255.0;
        self.green = 107.0;
        self.blue = 0;
    }
    
    if([self.weatherID isEqualToString:@"3"]){
        self.red = 255.0;
        self.green = 107.0;
        self.blue = 0;
    }
    
    if([self.weatherID isEqualToString:@"4"]){
        self.red = 255.0;
        self.green = 107.0;
        self.blue = 0;
    }
    
    
    if([self.weatherID isEqualToString:@"5"]){
        self.red = 255.0;
        self.green = 107.0;
        self.blue = 0;
    }
    
    
    if([self.weatherID isEqualToString:@"6"]){
        self.red = 255.0;
        self.green = 107.0;
        self.blue = 0;
    }
    
    
    if([self.weatherID isEqualToString:@"7"]){
        self.red = 255.0;
        self.green = 107.0;
        self.blue = 0;
    }
    
    if([self.weatherID isEqualToString:@"8"]){
        self.red = 255.0;
        self.green = 107.0;
        self.blue = 0;
    }

}

@end
