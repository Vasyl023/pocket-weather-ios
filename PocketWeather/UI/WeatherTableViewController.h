//
//  WeatherTableViewController.h
//  PocketWeather
//
//  Created by Vasyl Pastushenko on 4/2/16.
//  Copyright © 2016 Vasyl Pastushenko. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PochetWeather.h"

@interface WeatherTableViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>{
    __weak IBOutlet UITableView *tableDisposer;
}

@property (strong, nonatomic) PochetWeather *weather;


@end
