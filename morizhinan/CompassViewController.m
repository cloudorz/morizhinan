//
//  CompassViewController.m
//  morizhinan
//
//  Created by Dai Cloud on 12-6-7.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "CompassViewController.h"
#import "CustomBarButtonItem.h"

#define toRad(X) (X*M_PI/180.0)
#define toDeg(X) (X*180.0/M_PI)

@interface CompassViewController ()
-(NSString *)descriptionForHeading:(CGFloat)value;
@end

@implementation CompassViewController

@synthesize compassView=_compassView;
@synthesize forwardGeocoder=_forwardGeocoder;
@synthesize locationManager=_locationManager;
@synthesize descLabel=_descLabel;

- (void)dealloc
{
    [_compassView release];
    [_forwardGeocoder release];
    [_locationManager release];
    [_descLabel release];
    
    [super dealloc];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)updateHeadingDisplays {
    // Animate Compass
    [UIView     animateWithDuration:0.3
                              delay:0.0 
                            options:UIViewAnimationOptionBeginFromCurrentState | UIViewAnimationOptionCurveEaseOut | UIViewAnimationOptionAllowUserInteraction
                         animations:^{
                             CGAffineTransform headingRotation;
                             headingRotation = CGAffineTransformRotate(CGAffineTransformIdentity, (CGFloat)-toRad(currentHeading));
                             self.compassView.transform = headingRotation;
                         }
                         completion:^(BOOL finished) {
                             
                         }];
//    NSLog(@"heading:%f", currentHeading);
    self.descLabel.text = [self descriptionForHeading:currentHeading];

    
}


// Delegate method from the CLLocationManagerDelegate protocol.
- (void)locationManager:(CLLocationManager *)manager
    didUpdateToLocation:(CLLocation *)newLocation
           fromLocation:(CLLocation *)oldLocation
{
//    NSLog(@"latitude %+.6f, longitude %+.6f\n",
//          newLocation.coordinate.latitude,
//          newLocation.coordinate.longitude);
    currentLocation = newLocation.coordinate;
    [self updateHeadingDisplays];
    // else skip the event and process the next one.
}

- (void)startLocationHeadingEvents {
    if (!self.locationManager) {
        CLLocationManager* theManager = [[[CLLocationManager alloc] init] autorelease];
        
        // Retain the object in a property.
        self.locationManager = theManager;
        self.locationManager.delegate = self;
    }
    
    // Start location services to get the true heading.
    self.locationManager.distanceFilter = 1;
    self.locationManager.desiredAccuracy = kCLLocationAccuracyKilometer;
    [self.locationManager startUpdatingLocation];
    
    // Start heading updates.
    if ([CLLocationManager headingAvailable]) {
        self.locationManager.headingFilter = 1;
        [self.locationManager startUpdatingHeading];
    }
    
}

- (void)locationManager:(CLLocationManager *)manager didUpdateHeading:(CLHeading *)newHeading {
    if (newHeading.headingAccuracy < 0)
        return;
    
    // Use the true heading if it is valid.
    CLLocationDirection  theHeading = ((newHeading.trueHeading > 0) ?
                                       newHeading.trueHeading : newHeading.magneticHeading);
    
    currentHeading = theHeading;
    [self updateHeadingDisplays];
}

-(NSString *)descriptionForHeading:(CGFloat)value
{
    NSString *direction;
    if ((value > 337.5 && value <= 360) || (value >= 0 && value <= 22.5)) {
        direction = @"北";
    } else if (value > 22.5 && value <= 67.5) {
        direction = @"东北";
    } else if (value > 67.5 && value <= 112.5) {
        direction = @"东";
    } else if (value > 112.5 && value <= 157.5) {
        direction = @"东南";
    } else if (value > 157.5 && value <= 202.5) {
        direction = @"南";
    } else if (value > 202.5 && value <= 247.5) {
        direction = @"西南";
    } else if (value > 247.5 && value <= 292.5) {
        direction = @"西";
    } else if (value > 292.5 && value <= 337.5) {
        direction = @"西北";
    }

    return [NSString stringWithFormat:@"%@ %.0f°", direction, value];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationItem.hidesBackButton = YES;
    self.navigationItem.leftBarButtonItem = [[[CustomBarButtonItem alloc] initBackBarButtonItemWithTarget:self action:@selector(backAction:)] autorelease];
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"background_texture.png"]];
}


-(void)backAction:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    [self startLocationHeadingEvents];  
    
    [self updateHeadingDisplays];
}

- (void)viewWillDisappear:(BOOL)animated {
    if (self.locationManager) {
        [self.locationManager stopUpdatingHeading];
        [self.locationManager stopUpdatingLocation];
    }
    [super viewWillDisappear:animated];

}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)forwardGeocoderFoundLocation:(BSForwardGeocoder*)geocoder
{
	if(self.forwardGeocoder.status == G_GEO_SUCCESS)
	{
        
        [self updateHeadingDisplays];
        
        
	}
	else {
		NSString *message = @"";
		
		switch (self.forwardGeocoder.status) {
			case G_GEO_BAD_KEY:
				message = @"The API key is invalid.";
				break;
				
			case G_GEO_UNKNOWN_ADDRESS:
				message = [NSString stringWithFormat:@"Could not find %@", self.forwardGeocoder.searchQuery];
				break;
				
			case G_GEO_TOO_MANY_QUERIES:
				message = @"Too many queries has been made for this API key.";
				break;
				
			case G_GEO_SERVER_ERROR:
				message = @"Server error, please try again.";
				break;
				
			default:
				break;
		}
		
		UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Information" 
														message:message
													   delegate:nil 
											  cancelButtonTitle:@"OK" 
											  otherButtonTitles: nil];
		[alert show];
		[alert release];
	}
}

@end
