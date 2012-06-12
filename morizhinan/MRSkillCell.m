//
//  MRSkillCell.m
//  morizhinan
//
//  Created by Dai Cloud on 12-6-9.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "MRSkillCell.h"

@implementation MRSkillCell

@synthesize btnL=_btnL;
@synthesize btnM=_btnM;
@synthesize btnR=_btnR;

- (void)dealloc
{
    [_btnL release];
    [_btnM release];
    [_btnR release];
    [super dealloc];
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        self.contentView.backgroundColor = [UIColor clearColor];
        
        self.btnL = [UIButton buttonWithType:UIButtonTypeCustom];
        self.btnL.frame = CGRectMake(29, 20, 64, 64);
        self.btnL.backgroundColor = [UIColor blueColor];
        [self.contentView addSubview:self.btnL];
        
        self.btnM = [UIButton buttonWithType:UIButtonTypeCustom];
        self.btnM.frame = CGRectMake(124, 20, 64, 64);
        self.btnM.backgroundColor = [UIColor redColor];
        [self.contentView addSubview:self.btnM];
        
        self.btnR = [UIButton buttonWithType:UIButtonTypeCustom];
        self.btnR.frame = CGRectMake(216, 20, 64, 64);
        self.btnR.backgroundColor = [UIColor yellowColor];
        [self.contentView addSubview:self.btnR];
        
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
