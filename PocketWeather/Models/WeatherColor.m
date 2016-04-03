//
//  WeatherColor.m
//  PocketWeather
//
//  Created by Vasyl Pastushenko on 4/3/16.
//  Copyright © 2016 Vasyl Pastushenko. All rights reserved.
//

#import "WeatherColor.h"

@implementation WeatherColor

- (id)initWithWeathearId:(NSString*)aWeatherId{
    if(self = [super init]){
        [self updateColor];
    }
    return self;
}

- (UIColor*)getColor{
    return [UIColor colorWithRed:self.red / 255.0
                           green:self.green / 255.0
                            blue:self.blue / 255.0
                           alpha:1];
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

- (void)updateColor{
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

}

@end
