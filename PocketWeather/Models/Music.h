//
//  Music.h
//  PocketWeather
//
//  Created by Vasyl Pastushenko on 4/3/16.
//  Copyright © 2016 Vasyl Pastushenko. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Music : NSObject

@property (readwrite, assign, nonatomic) NSString* artist;
@property (readwrite, assign, nonatomic) NSString* name;
@property (readwrite, assign, nonatomic) NSString* album;
@property (readwrite, assign, nonatomic) NSString* source;
@property (readwrite, assign, nonatomic) NSString* coverPicture;

@end
