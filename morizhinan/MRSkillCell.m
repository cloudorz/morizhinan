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
@synthesize titleL=_titleL, titleM=_titleM, titleR=_titleR;

- (void)dealloc
{
    [_btnL release];
    [_btnM release];
    [_btnR release];
    [_titleL release];
    [_titleM release];
    [_titleR release];
    [super dealloc];
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        self.contentView.backgroundColor = [UIColor clearColor];
        
        self.btnL = [UIButton buttonWithType:UIButtonTypeCustom];
        self.btnL.frame = CGRectMake(29, 10, 64, 64);
        self.btnL.backgroundColor = [UIColor clearColor];
        self.titleL = [[[UILabel alloc] initWithFrame:CGRectMake(29, 84, 64, 14)] autorelease];
        self.titleL.textAlignment = UITextAlignmentCenter;
        self.titleL.font = [UIFont systemFontOfSize:12.0f];
        self.titleL.backgroundColor = [UIColor clearColor];
        
        [self.contentView addSubview:self.titleL];
        [self.contentView addSubview:self.btnL];
        
        self.btnM = [UIButton buttonWithType:UIButtonTypeCustom];
        self.btnM.frame = CGRectMake(124, 10, 64, 64);
        self.btnM.backgroundColor = [UIColor clearColor];
        self.titleM = [[[UILabel alloc] initWithFrame:CGRectMake(124, 84, 64, 14)] autorelease];
        self.titleM.textAlignment = UITextAlignmentCenter;
        self.titleM.font = [UIFont systemFontOfSize:12.0f];
        self.titleM.backgroundColor = [UIColor clearColor];
        
        [self.contentView addSubview:self.titleM];
        [self.contentView addSubview:self.btnM];
        
        self.btnR = [UIButton buttonWithType:UIButtonTypeCustom];
        self.btnR.frame = CGRectMake(216, 10, 64, 64);
        self.btnR.backgroundColor = [UIColor clearColor];
        self.titleR = [[[UILabel alloc] initWithFrame:CGRectMake(216, 84, 64, 14)] autorelease];
        self.titleR.textAlignment = UITextAlignmentCenter;
        self.titleR.font = [UIFont systemFontOfSize:12.0f];
        self.titleR.backgroundColor = [UIColor clearColor];
        
        [self.contentView addSubview:self.titleR];
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
