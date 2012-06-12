//
//  CountDownViewController.h
//  morizhinan
//
//  Created by Dai Cloud on 12-6-8.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CountDownViewController : UIViewController

@property (strong, nonatomic) IBOutlet UILabel *dayLabel, *hourLabel, *minuteLabel, *secondLabel;
@property (strong, nonatomic) NSTimer *timer;
@property (strong, nonatomic) NSDate *date2012;

@end
