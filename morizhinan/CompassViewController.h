//
//  CompassViewController.h
//  morizhinan
//
//  Created by Dai Cloud on 12-6-7.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CLLocation.h>
#import <CoreLocation/CLLocationManager.h>
#import <CoreLocation/CLLocationManagerDelegate.h>

#import "BSForwardGeocoder.h"
#import "BSKmlResult.h"


@interface CompassViewController : UIViewController <CLLocationManagerDelegate, UISearchBarDelegate, BSForwardGeocoderDelegate>
{
    CLLocationCoordinate2D  currentLocation;
    CLLocationDirection     currentHeading;
    
}

@property (strong, nonatomic) IBOutlet UIScrollView *compassView;
@property (strong, nonatomic) IBOutlet UILabel *descLabel;
@property (strong, nonatomic) BSForwardGeocoder *forwardGeocoder;
@property (strong, nonatomic) CLLocationManager *locationManager;

@end
