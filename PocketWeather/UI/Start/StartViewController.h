//
//  StartViewController.h
//  PocketWeather
//
//  Created by Vasyl Pastushenko on 4/3/16.
//  Copyright © 2016 Vasyl Pastushenko. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
@interface StartViewController : UIViewController<CLLocationManagerDelegate>{
    __weak IBOutlet UIImageView *sunImageView;
}
@property (strong,nonatomic) PocketWeather* pw;

@end
