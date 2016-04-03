//
//  WeatherReaquest.h
//  PocketWeather
//
//  Created by Vasyl Pastushenko on 4/3/16.
//  Copyright © 2016 Vasyl Pastushenko. All rights reserved.
//

#import "NetworkOperationManager.h"

@interface WeatherRequest : NetworkOperationManager

- (NSURLSessionDataTask*)getWeatherWithlong:(NSString*)aLong
                                        lat:(NSString*)aLat
                                 completion:(void (^) (NSDictionary *response))completion;


@end
