//
//  WeatherTableViewController.m
//  PocketWeather
//
//  Created by Vasyl Pastushenko on 4/2/16.
//  Copyright © 2016 Vasyl Pastushenko. All rights reserved.
//

#import "WeatherTableViewController.h"
#import "ColorTableViewCell.h"

@interface WeatherTableViewController (){
    NSArray *weatherCells;
}

@end

@implementation WeatherTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    tableDisposer.delegate = self;
    tableDisposer.dataSource = self;
    
    // Fill Data
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


#pragma mark - Table View
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 10;    //count number of row from counting array hear cataGorry is An Array
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    ColorTableViewCell *cell = (ColorTableViewCell *)[tableView dequeueReusableCellWithIdentifier:[ColorTableViewCellDataSource reuseIdentifier]];
    
    if (cell == nil)
    {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:[ColorTableViewCellDataSource nibName] owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    
    cell.detailTextLabel.text = @"test";
    
    return cell;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [ColorTableViewCellDataSource height];
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
}


@end
