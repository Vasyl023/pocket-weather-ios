//
//  Music.m
//  PocketWeather
//
//  Created by Vasyl Pastushenko on 4/3/16.
//  Copyright © 2016 Vasyl Pastushenko. All rights reserved.
//

#import "Music.h"

@implementation Music

- (id)initWithJSON:(NSDictionary*)aJSON{
    self = [super init];
    if(self){
        self.artist = aJSON[@"artist"];
        self.album = aJSON[@"album"];
        self.coverPictureURL = aJSON[@"cover"];
        self.duration = aJSON[@"duration"];
        self.source = aJSON[@"source"];
        self.title = aJSON[@"title"];
    }
    return self;
}

@end
