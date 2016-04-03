//
//  AppController.m
//  PocketWeather
//
//  Created by Vasyl Pastushenko on 4/3/16.
//  Copyright © 2016 Vasyl Pastushenko. All rights reserved.
//

#import "AppController.h"

@implementation AppController

+ (NSString*)apiURL{
    return [[NSBundle mainBundle] objectForInfoDictionaryKey:@"ApiURL"];
}

@end
