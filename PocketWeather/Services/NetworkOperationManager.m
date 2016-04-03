//
//  NetworkOperationManager.m
//  PocketWeather
//
//  Created by Vasyl Pastushenko on 4/3/16.
//  Copyright © 2016 Vasyl Pastushenko. All rights reserved.
//

#import "NetworkOperationManager.h"

@implementation NetworkOperationManager
+ (AFHTTPSessionManager *)sharedSessionManager {
    static AFHTTPSessionManager *sharedManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSURLSessionConfiguration *sessionConfiguration = [NSURLSessionConfiguration defaultSessionConfiguration];
        
        sharedManager = [[AFHTTPSessionManager alloc] initWithSessionConfiguration:sessionConfiguration];
        
        NSURL* baseUrl = [[NSURL alloc] initWithString:kBaseAPIUrl];
        
        sharedManager = [sharedManager initWithBaseURL:baseUrl];
        [sharedManager setResponseSerializer:[AFJSONResponseSerializer alloc]];
        sharedManager.requestSerializer = [AFHTTPRequestSerializer serializer];
        
    });
    
    return sharedManager;
}

- (NSURLSessionDataTask*)sentRequest:(NSString*)anUrl
                              params:(NSDictionary*)aParams
                              method:(NSString*)aMethod
                          completion:(void (^) (NSDictionary *response))completion{
    NSString *requestUrl = [NSString stringWithFormat:@"%@%@",[AppController apiURL], anUrl];
    
    NSMutableDictionary *params = [[NSMutableDictionary alloc] initWithDictionary:aParams];

    AFHTTPSessionManager* manager = [NetworkOperationManager sharedSessionManager];

    NSMutableURLRequest *request = [[AFJSONRequestSerializer serializer] requestWithMethod:aMethod
                                                                                 URLString:requestUrl
                                                                                parameters:params
                                                                                     error:nil];
    
    return [manager dataTaskWithRequest:request completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
        
        if (!error) {
            NSLog(@"Reply JSON: %@", responseObject);
            completion(responseObject);
            
        } else {
            NSLog(@"Error: %@, %@, %@", error, response, responseObject);
        }
        
    }];
    
    
}

@end
