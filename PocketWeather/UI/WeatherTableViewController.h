//
//  WeatherTableViewController.h
//  PocketWeather
//
//  Created by Vasyl Pastushenko on 4/2/16.
//  Copyright © 2016 Vasyl Pastushenko. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PocketWeather.h"
#import <CoreLocation/CoreLocation.h>

@interface WeatherTableViewController : UIViewController<UITableViewDelegate, UITableViewDataSource,CLLocationManagerDelegate>{
    __weak IBOutlet UITableView *tableDisposer;
    float ColorCellheight;
}

@property (strong, nonatomic) PocketWeather *weather;


@end
