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

@interface WeatherTableViewController (){
    NSMutableArray *weatherDataSources;
}

@end

@implementation WeatherTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    tableDisposer.delegate = self;
    tableDisposer.dataSource = self;
    tableDisposer.rowHeight = 40.0;
    tableDisposer.estimatedRowHeight = 40.0;
    
    // Fill Data
    [self fillDataSources];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)fillDataSources{
    weatherDataSources = [NSMutableArray array];
    WeatherInfoTableViewCellDataSource* data = [[WeatherInfoTableViewCellDataSource alloc] init];
    [weatherDataSources addObject:data];
    
    for (int i = 0; i < 10; i++) {
        [weatherDataSources addObject:[[ColorTableViewCellDataSource alloc] init]];
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

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    BaseTableViewCell *cell = (BaseTableViewCell *)[tableView dequeueReusableCellWithIdentifier:[[weatherDataSources[indexPath.row] class] reuseIdentifier]];
    
    if (cell == nil)
    {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:[[weatherDataSources[indexPath.row] class] nibName] owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    
    cell.dataSource = weatherDataSources[indexPath.row];
    
    return cell;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [[weatherDataSources[indexPath.row] class] height];

}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
}


@end
