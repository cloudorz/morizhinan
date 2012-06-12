//
//  CountDownViewController.m
//  morizhinan
//
//  Created by Dai Cloud on 12-6-8.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "CountDownViewController.h"
#import "CustomBarButtonItem.h"

@interface CountDownViewController ()

@end

@implementation CountDownViewController

@synthesize timer=_timer;
@synthesize dayLabel=_dayLabel;
@synthesize hourLabel=_hourLabel;
@synthesize minuteLabel=_minuteLabel;
@synthesize secondLabel=_secondLabel;
@synthesize date2012=_date2012;

- (void)dealloc
{
    [_timer release];
    [_dayLabel release];
    [_hourLabel release];
    [_minuteLabel release];
    [_secondLabel release];
    [_date2012 release];
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
    self.timer = [NSTimer scheduledTimerWithTimeInterval:(1.0) target:self selector:@selector(updateCountDownLabels) userInfo:nil repeats:YES];
    
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    [df setTimeZone:[NSTimeZone defaultTimeZone]];
    [df setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    self.date2012 = [df dateFromString:@"2012-12-21 23:59:59"];
    
    [self updateCountDownLabels];
    
    self.navigationItem.hidesBackButton = YES;
    self.navigationItem.leftBarButtonItem = [[[CustomBarButtonItem alloc] initBackBarButtonItemWithTarget:self action:@selector(backAction:)] autorelease];
    
 
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
    [self.timer invalidate];
}

-(void)updateCountDownLabels
{
    NSTimeInterval seconds = [self.date2012 timeIntervalSinceDate:[NSDate date]];
//    NSLog(@"miao: %f", seconds);
    NSInteger intSeconds = (NSInteger)seconds;
    NSInteger day = intSeconds/(24*3600);
    NSInteger hour = (intSeconds - day*24*3600)/3600;
    NSInteger minute = (intSeconds - day*24*3600 - hour*3600)/60;
    NSInteger second = intSeconds - day*24*3600 - hour*3600 - minute*60;
    
    self.dayLabel.text = [NSString stringWithFormat:@"%d天", day];
    self.hourLabel.text = [NSString stringWithFormat:@"%d小时", hour];
    self.minuteLabel.text = [NSString stringWithFormat:@"%d分", minute];
    self.secondLabel.text = [NSString stringWithFormat:@"%d秒", second];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
