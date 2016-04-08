//
//  PochetWeather.m
//  PocketWeather
//
//  Created by Vasyl Pastushenko on 4/2/16.
//  Copyright © 2016 Vasyl Pastushenko. All rights reserved.
//

#import "PocketWeather.h"
#import "Music.h"

@implementation PocketWeather

- (id)initWithJSON:(NSDictionary*)json{
    
    self = [super init];
    if (self) {
        NSDictionary *weatherBlock = json[@"weather"];
        NSLog(@"%@",weatherBlock);

        self.locationName = weatherBlock[@"locationName"];
        self.weatherSlogan = weatherBlock[@"weatherSlogan"];
        NSNumberFormatter *tmp = [[NSNumberFormatter alloc] init];
        tmp.numberStyle = NSNumberFormatterDecimalStyle;
        NSNumber *tempreture = [tmp numberFromString:[weatherBlock[@"weatherTemperature"] stringValue]];
        
        self.weatherTemperature = [NSString stringWithFormat:@"%.0f˚",([tempreture floatValue] - KELVIN_DIFFERENCE) ];
        
        
        if([[weatherBlock[@"weatherId"] stringValue] length] > 1)
            self.weatherId = [[weatherBlock[@"weatherId"] stringValue] substringToIndex:1];
        else
            self.weatherId = @"1";

        self.weatherTime = [self formatDateFrom1970:weatherBlock[@"weatherTime"]];
        // Get list of music
        self.music = [self parseMusics:json[@"playlist"][@"data"]];
        
    }
    
    return self;
}

- (NSString*)formatDateFrom1970:(NSString*)aDate{
    
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:[aDate doubleValue]];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"HH:mm, d"];
    
    NSString *formattedDate = [dateFormatter stringFromDate:date];
    
    
    [dateFormatter setDateFormat:@"MMMM"];
    
    NSString *formattedDateMonthPart = [dateFormatter stringFromDate:date];

    return [NSString stringWithFormat:@"%@ of %@", formattedDate, formattedDateMonthPart];

}


- (NSArray*)parseMusics:(NSDictionary*)aMusic{
    NSMutableArray *tmpMusicArray = [NSMutableArray new];
    for (NSDictionary* obj in aMusic) {
        [tmpMusicArray addObject:[[Music alloc] initWithJSON:obj]];
    }
    return tmpMusicArray;
}

@end
