//
//  PochetWeather.h
//  PocketWeather
//
//  Created by Vasyl Pastushenko on 4/2/16.
//  Copyright © 2016 Vasyl Pastushenko. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PocketWeather : NSObject

@property (readwrite, nonatomic, strong) NSString *weatherTime;
@property (readwrite, nonatomic, strong) NSNumber *weatherTemperature;
@property (readwrite, nonatomic, assign) NSString *locationName;
@property (readwrite, nonatomic, assign) NSString *weatherSlogan;
@property (readwrite, nonatomic, strong) NSString *fearureImageId;
@property (readwrite, nonatomic, strong) NSString *fearureColorId;

@end
