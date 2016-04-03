//
//  PochetWeather.m
//  PocketWeather
//
//  Created by Vasyl Pastushenko on 4/2/16.
//  Copyright © 2016 Vasyl Pastushenko. All rights reserved.
//

#import "PocketWeather.h"

@implementation PocketWeather

- (id)initWithJSON:(NSDictionary*)json{
    
    self = [super init];
    
    if (self) {
        self.locationName = @"New York";
        self.weatherSlogan = @"Sun";
        self.weatherTemperature = [NSNumber numberWithUnsignedInt:10];
        self.fearureColorId = @"test";
        self.fearureImageId = @"test";
    }
    
    return self;
}

@end
