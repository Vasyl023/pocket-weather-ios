//
//  WeatherReaquest.m
//  PocketWeather
//
//  Created by Vasyl Pastushenko on 4/3/16.
//  Copyright © 2016 Vasyl Pastushenko. All rights reserved.
//

#import "WeatherRequest.h"

@implementation WeatherRequest

- (NSURLSessionDataTask*)getWeatherWithlong:(NSString*)aLong
                                        lat:(NSString*)aLat
                                 completion:(void (^) (NSDictionary *response))completion{
    
    NSString *url = [NSString stringWithFormat:@"/weather/%@/%@", aLat, aLong];
    
    return [self sentRequest:url params:nil method:@"GET" completion:completion];
    
}

@end
