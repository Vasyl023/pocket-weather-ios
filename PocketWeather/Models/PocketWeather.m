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
        NSDictionary *weatherBlock = json[@"weather"];
        self.locationName = weatherBlock[@"locationName"];
        self.weatherSlogan = weatherBlock[@"weatherSlogan"];
        self.weatherTemperature = [NSNumber numberWithUnsignedInt:10];
        self.weatherId = @"weatherId";
        self.fearureImageId = @"test";
    }
    
    return self;
}

@end
