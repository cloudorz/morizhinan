//
//  InfoListViewController.h
//  morizhinan
//
//  Created by Dai Cloud on 12-6-12.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface InfoListViewController : UITableViewController
{
@private
    NSArray *_infolist;
}

@property (strong, nonatomic, readonly) NSArray *infolist;

@end
