//
//  GlimViewController.m
//  morizhinan
//
//  Created by Dai Cloud on 12-6-8.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "GlimViewController.h"
#import <AVFoundation/AVFoundation.h>
#import "CustomBarButtonItem.h"

@interface GlimViewController ()

@end

@implementation GlimViewController

@synthesize lighter=_lighter;

- (void)dealloc
{
    [_lighter release];
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

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationItem.hidesBackButton = YES;
    self.navigationItem.leftBarButtonItem = [[[CustomBarButtonItem alloc] initBackBarButtonItemWithTarget:self action:@selector(backAction:)] autorelease];
    
    AVCaptureDevice *device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    if ([device torchMode] == AVCaptureTorchModeOn) {
        self.lighter.image = [UIImage imageNamed:@"lighterb-on.png"];
    } else {
        self.lighter.image = [UIImage imageNamed:@"lighterb.png"];
    }
    
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

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

-(IBAction)gilmControlAction:(id)sender
{
    AVCaptureDevice *device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    if ([device hasTorch]) {
        [device lockForConfiguration:nil];
        [device setTorchMode: [device torchMode] == AVCaptureTorchModeOff ? AVCaptureTorchModeOn : AVCaptureTorchModeOff];
        [device unlockForConfiguration];
    }
    
    if ([device torchMode] == AVCaptureTorchModeOn) {
        self.lighter.image = [UIImage imageNamed:@"lighterb-on.png"];
    } else {
        self.lighter.image = [UIImage imageNamed:@"lighterb.png"];
    }
}

@end
