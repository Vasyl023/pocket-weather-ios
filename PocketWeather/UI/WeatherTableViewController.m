//
//  WeatherTableViewController.m
//  PocketWeather
//
//  Created by Vasyl Pastushenko on 4/2/16.
//  Copyright © 2016 Vasyl Pastushenko. All rights reserved.
//

#import "WeatherTableViewController.h"
#import "ColorTableViewCell.h"
#import "WeatherInfoTableViewCell.h"
#import "WeatherRequest.h"

@interface WeatherTableViewController (){
    NSMutableArray *weatherDataSources;
    CLLocationManager *locationManager;
}

@end

@implementation WeatherTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];


    [self setupLocation];
    
    tableDisposer.delegate = self;
    tableDisposer.dataSource = self;
    
    // Set Color cell height, with formula from method
    ColorCellheight = [self getColorCellHeight];
    
    tableDisposer.rowHeight = ColorCellheight;
    tableDisposer.estimatedRowHeight = ColorCellheight;
    
    // Fill Data
    [self fillDataSources];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - network manager

- (void)getWeatherLong:(NSString*)longitude
                   lat:(NSString*)latitude{
    
    NSURLSessionDataTask *request = [[[WeatherRequest alloc] init] getWeatherWithlong:longitude lat:latitude completion:^(NSDictionary *response) {
        NSLog(@"done");
    }];
    
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
                               initWithTitle:@"Error" message:@"Failed to Get Your Location" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [errorAlert show];
}

- (void)locationManager:(CLLocationManager *)manager
    didUpdateToLocation:(CLLocation *)newLocation
           fromLocation:(CLLocation *)oldLocation
{
    NSLog(@"didUpdateToLocation: %@", newLocation);
    CLLocation *currentLocation = newLocation;
    
    if (currentLocation != nil) {
        
        [self getWeatherLong:[NSString stringWithFormat:@"%.8f", currentLocation.coordinate.longitude]
                         lat:[NSString stringWithFormat:@"%.8f", currentLocation.coordinate.latitude]];

        [locationManager stopUpdatingLocation];
    }
    
}

// Calculate height for color cell, for different screen sizes
// It should fit for all iphone, iPad sizes
- (float)getColorCellHeight{
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    CGFloat screenHeight = screenRect.size.height;
    float colorCellHeight = (screenHeight - WEATHER_MAIN_TABLE_CELL_HEIGHT) / NUMBER_OF_COLOR_CELL_ON_PAGE;
    
    return colorCellHeight;
}

// Fill data for current weather
// Get all data from defines
// first weather info object
// after color objects
- (void)fillDataSources{
    weatherDataSources = [[NSMutableArray alloc] init];
    
    WeatherColor *weatherColor = [[WeatherColor alloc] initWithWeathearId:@"1"];
    
    WeatherInfoTableViewCellDataSource* data = [[WeatherInfoTableViewCellDataSource alloc] initWithWeatherId:@"1"];
    
    [weatherDataSources addObject:data];
    
    for (int i = 0; i < NUMBER_OF_COLOR_CELL_ON_PAGE; i++) {
        [weatherColor updateColorWithStep:10];
        [weatherDataSources addObject:
         [[ColorTableViewCellDataSource alloc] initWithColor:[weatherColor getColor]
                                                      height:ColorCellheight]
         ];
    }
}

#pragma mark - Table View
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [weatherDataSources count];    //count number of row from counting array hear cataGorry is An Array
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewAutomaticDimension;
}


// Check what type first and init cells
// It doesn`t work without this code duplication
- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    if([[weatherDataSources[indexPath.row] class] isSubclassOfClass: [ColorTableViewCellDataSource class]]){
        
        ColorTableViewCell* cell = (ColorTableViewCell *)[tableView dequeueReusableCellWithIdentifier:[[weatherDataSources[indexPath.row] class] reuseIdentifier]];
        
        if (cell == nil)
        {
            NSArray *nib = [[NSBundle mainBundle] loadNibNamed:[[weatherDataSources[indexPath.row] class] nibName] owner:self options:nil];
            cell = [nib objectAtIndex:0];
        }

        [cell setData: weatherDataSources[indexPath.row]];

        return cell;


    }else{
        
        WeatherInfoTableViewCell* cell = (WeatherInfoTableViewCell*)[tableView dequeueReusableCellWithIdentifier:[[weatherDataSources[indexPath.row] class] reuseIdentifier]];
        
        
        if (cell == nil)
        {
            NSArray *nib = [[NSBundle mainBundle] loadNibNamed:[[weatherDataSources[indexPath.row] class] nibName] owner:self options:nil];
            cell = [nib objectAtIndex:0];
        }
        
        [cell setData:weatherDataSources[indexPath.row]];
        
        return cell;

    }
    
}

// Different height for 2 types of cell
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if([[weatherDataSources[indexPath.row] class] isSubclassOfClass: [ColorTableViewCellDataSource class]])
        return [weatherDataSources[indexPath.row] height];
    else
        return [[weatherDataSources[indexPath.row] class] height];
        
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
}


@end
