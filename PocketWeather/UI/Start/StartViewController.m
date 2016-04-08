//
//  StartViewController.m
//  PocketWeather
//
//  Created by Vasyl Pastushenko on 4/3/16.
//  Copyright © 2016 Vasyl Pastushenko. All rights reserved.
//

#import "StartViewController.h"
#import "WeatherRequest.h"
#import "WeatherTableViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface StartViewController (){
    CLLocationManager *locationManager;
}

@end

@implementation StartViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self startLoading];
    [self setupLocation];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)startLoading{
    [self runSpinAnimationOnView:sunImageView duration:1000 rotations:0.5 repeat:1];
}

#pragma marl - animation

- (void) runSpinAnimationOnView:(UIView*)view
                       duration:(CGFloat)duration
                      rotations:(CGFloat)rotations
                         repeat:(float)repeat;
{
    CABasicAnimation* rotationAnimation;
    rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotationAnimation.toValue = [NSNumber numberWithFloat: M_PI * 2.0 /* full rotation*/ * rotations * duration ];
    rotationAnimation.duration = duration;
    rotationAnimation.cumulative = YES;
    rotationAnimation.repeatCount = repeat;
    
    [view.layer addAnimation:rotationAnimation forKey:@"rotationAnimation"];
}


#pragma mark - network manager

- (void)getWeatherLong:(NSString*)longitude
                   lat:(NSString*)latitude{
    
    NSURLSessionDataTask *request = [[[WeatherRequest alloc] init] getWeatherWithlong:longitude lat:latitude completion:^(NSDictionary *response) {
        NSLog(@"%@",response);
        self.pw = [[PocketWeather alloc] initWithJSON:response];
        
        [self performSegueWithIdentifier:@"showWeather" sender:self];
    } ];
    
    
    [request resume];
}

#pragma marl - CLlocation manager
- (void)setupLocation{
    locationManager = [[CLLocationManager alloc] init];
    
    if ([locationManager respondsToSelector:@selector(requestWhenInUseAuthorization)]) {
        [locationManager requestWhenInUseAuthorization];
    }
    locationManager.delegate = self;
    locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    
    [locationManager startUpdatingLocation];
}

- (void)locationManager:(CLLocationManager *)manager
       didFailWithError:(NSError *)error
{
    
    UIAlertView *errorAlert = [[UIAlertView alloc]
                               initWithTitle:@"Error" message:@"Failed to Get Your Location, please allow to track your location"
                                    delegate:nil
                            cancelButtonTitle:@"OK"
                               otherButtonTitles:nil];
    [errorAlert show];
}

- (void)locationManager:(CLLocationManager *)manager
    didUpdateToLocation:(CLLocation *)newLocation
           fromLocation:(CLLocation *)oldLocation
{
    NSLog(@"didUpdateToLocation: %@", newLocation);
    CLLocation *currentLocation = newLocation;
    
    if (currentLocation != nil) {
        [locationManager stopUpdatingLocation];

        [self getWeatherLong:[NSString stringWithFormat:@"%.8f", currentLocation.coordinate.longitude]
                         lat:[NSString stringWithFormat:@"%.8f", currentLocation.coordinate.latitude]];
        
    }
    
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if([segue.identifier isEqualToString:@"showWeather"]) {
        PocketWeather *pw = self.pw;
        WeatherTableViewController *vc = (WeatherTableViewController *)segue.destinationViewController;
        vc.weather = pw;
        ((WeatherTableViewController *)segue.destinationViewController).weather = pw;
    }
}

@end
