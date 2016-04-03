//
//  NetworkOperationManager.h
//  PocketWeather
//
//  Created by Vasyl Pastushenko on 4/3/16.
//  Copyright © 2016 Vasyl Pastushenko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking.h>

@interface NetworkOperationManager : NSObject

+ (AFHTTPSessionManager *)sharedSessionManager;

- (NSURLSessionDataTask*)sentRequest:(NSString*)anUrl
             params:(NSDictionary*)aParams
             method:(NSString*)aMethod
         completion:(void (^) (NSDictionary *response))completion;


@end
