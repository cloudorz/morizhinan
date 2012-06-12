//
//  SkillListViewController.h
//  morizhinan
//
//  Created by Dai Cloud on 12-6-9.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SkillListViewController : UITableViewController
{
@private
    NSArray *_skills;
}

@property (nonatomic, retain, readonly) NSArray *skills;

@end
