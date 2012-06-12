//
//  DisasterListViewController.h
//  morizhinan
//
//  Created by Dai Cloud on 12-6-7.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DisasterListViewController : UITableViewController
{
@private
    NSArray *_disasters;
}

@property (nonatomic, retain, readonly) NSArray *disasters;

@end
