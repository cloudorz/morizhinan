//
//  MRItemCell.m
//  morizhinan
//
//  Created by Dai Cloud on 12-6-9.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "MRItemCell.h"
#import <QuartzCore/QuartzCore.h>

@implementation MRItemCell

@synthesize btnL=_btnL;
@synthesize btnM=_btnM;
@synthesize btnR=_btnR;
@synthesize leftPic=_leftPic;
@synthesize rightPic=_rightPic;
@synthesize middlePic=_middlePic;
@synthesize leftView=_leftView;
@synthesize rightView=_rightView;
@synthesize middleView=_middleView;
@synthesize leftLabel=_leftLabel;
@synthesize middleLabel=_middleLabel;
@synthesize rightLabel=_rightLabel;
@synthesize priceCoverL=_priceCoverL;
@synthesize priceCoverM=_priceCoverM;
@synthesize priceCoverR=_priceCoverR;
@synthesize priceL=_priceL;
@synthesize priceM=_priceM;
@synthesize priceR=_priceR;

- (void)dealloc
{
    [_btnL release];
    [_btnM release];
    [_btnR release];
    [_leftView release];
    [_leftPic release];
    [_rightView release];
    [_rightPic release];
    [_middleView release];
    [_middlePic release];
    [_leftLabel release];
    [_middleLabel release];
    [_rightLabel release];
    [_priceCoverL release];
    [_priceCoverM release];
    [_priceCoverR release];
    [_priceL release];
    [_priceM release];
    [_priceR release];
    
    [super dealloc];
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        self.contentView.backgroundColor = [UIColor clearColor];
        
        self.leftView = [[[UIView alloc] initWithFrame:CGRectMake(24, 12, 74, 74)] autorelease];
        self.leftView.backgroundColor = [UIColor colorWithRed:158/255.0 green:138/255.0 blue:109/255.0 alpha:1.0];
        self.leftView.clipsToBounds = NO;
        [self.leftView.layer setCornerRadius:3.0f];

        self.leftPic = [[[AsyncImageView alloc] initWithFrame:CGRectMake(5, 5, 64, 64)] autorelease];

        self.btnL = [UIButton buttonWithType:UIButtonTypeCustom];
        self.btnL.frame = CGRectMake(5, 5, 64, 64);
        self.btnL.backgroundColor = [UIColor clearColor];
        
        UIView *coverL = [[[UIView alloc] initWithFrame:CGRectMake(0, 60, 74, 14)] autorelease];
        coverL.backgroundColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:0.4];
        coverL.clipsToBounds = NO;
        [coverL.layer setCornerRadius:3.0f];
        
        self.leftLabel = [[[UILabel alloc] initWithFrame:CGRectMake(2, 0, 70, 14)] autorelease];
        self.leftLabel.backgroundColor = [UIColor clearColor];
        self.leftLabel.textAlignment = UITextAlignmentCenter;
        self.leftLabel.font = [UIFont systemFontOfSize:12.0f];
        self.leftLabel.textColor = [UIColor whiteColor];
        
        UIImageView *leftSide, *middleSide, *rightSide;

        
        self.priceCoverL = [[[UIView alloc] initWithFrame:CGRectMake(-4, 10, 18, 20)] autorelease];
        self.priceCoverL.backgroundColor = [UIColor clearColor];
        
            
        leftSide = [[[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 5, 20)] autorelease];
        leftSide.image = [UIImage imageNamed:@"ribbon_l.png"];
        leftSide.tag = 1;
        
        middleSide = [[[UIImageView alloc] initWithFrame:CGRectMake(5, 5, 1, 15)] autorelease];
        middleSide.image = [UIImage imageNamed:@"ribbon_m.png"];
        middleSide.contentMode = UIViewContentModeScaleToFill;
        middleSide.tag = 2;
        
        rightSide = [[[UIImageView alloc] initWithFrame:CGRectMake(6, 5, 12, 15)] autorelease];
        rightSide.image = [UIImage imageNamed:@"ribbon_r.png"];
        rightSide.tag = 3;
        
        self.priceL = [[[UILabel alloc] initWithFrame:CGRectMake(0, 5, 6, 15)] autorelease];
        self.priceL.textAlignment = UITextAlignmentLeft;
        self.priceL.textColor = [UIColor whiteColor];
        self.priceL.backgroundColor = [UIColor clearColor];
        self.priceL.font = [UIFont systemFontOfSize:10.0f];
        
        [self.priceCoverL addSubview:leftSide];
        [self.priceCoverL addSubview:middleSide];
        [self.priceCoverL addSubview:rightSide];
        [self.priceCoverL addSubview:self.priceL];
        
        [coverL addSubview:self.leftLabel];
        [self.leftView addSubview:self.leftPic];
        [self.leftView addSubview:coverL];
        [self.leftView addSubview:self.priceCoverL];
        [self.leftView addSubview:self.btnL];
        
        [self.contentView addSubview:self.leftView];
        
        
        self.middleView = [[[UIView alloc] initWithFrame:CGRectMake(123, 12, 74, 74)] autorelease];
        self.middleView.backgroundColor = [UIColor colorWithRed:158/255.0 green:138/255.0 blue:109/255.0 alpha:1.0];
        self.middleView.clipsToBounds = NO;
        [self.middleView.layer setCornerRadius:3.0f];
        
        self.middlePic = [[[AsyncImageView alloc] initWithFrame:CGRectMake(5, 5, 64, 64)] autorelease];
        
        self.btnM = [UIButton buttonWithType:UIButtonTypeCustom];
        self.btnM.frame = CGRectMake(5, 5, 64, 64);
        self.btnM.backgroundColor = [UIColor clearColor];
        
        UIView *coverM = [[[UIView alloc] initWithFrame:CGRectMake(0, 60, 74, 14)] autorelease];
        coverM.backgroundColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:0.4];
        coverM.clipsToBounds = NO;
        [coverM.layer setCornerRadius:3.0f];
        
        self.middleLabel = [[[UILabel alloc] initWithFrame:CGRectMake(2, 0, 70, 14)] autorelease];
        self.middleLabel.backgroundColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:0.4];
        self.middleLabel.textAlignment = UITextAlignmentCenter;
        self.middleLabel.font = [UIFont systemFontOfSize:12.0f];
        self.middleLabel.textColor = [UIColor whiteColor];
        
        self.priceCoverM = [[[UIView alloc] initWithFrame:CGRectMake(-4, 10, 18, 20)] autorelease];
        self.priceCoverM.backgroundColor = [UIColor clearColor];
        
        leftSide = [[[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 5, 20)] autorelease];
        leftSide.image = [UIImage imageNamed:@"ribbon_l.png"];
        leftSide.tag = 1;
        
        middleSide = [[[UIImageView alloc] initWithFrame:CGRectMake(5, 5, 1, 15)] autorelease];
        middleSide.image = [UIImage imageNamed:@"ribbon_m.png"];
        middleSide.contentMode = UIViewContentModeScaleToFill;
        middleSide.tag = 2;
        
        rightSide = [[[UIImageView alloc] initWithFrame:CGRectMake(6, 5, 12, 15)] autorelease];
        rightSide.image = [UIImage imageNamed:@"ribbon_r.png"];
        rightSide.tag = 3;
        
        self.priceM = [[[UILabel alloc] initWithFrame:CGRectMake(0, 5, 6, 15)] autorelease];
        self.priceM.textAlignment = UITextAlignmentLeft;
        self.priceM.textColor = [UIColor whiteColor];
        self.priceM.backgroundColor = [UIColor clearColor];
        self.priceM.font = [UIFont systemFontOfSize:10.0f];
        
        [self.priceCoverM addSubview:leftSide];
        [self.priceCoverM addSubview:middleSide];
        [self.priceCoverM addSubview:rightSide];
        [self.priceCoverM addSubview:self.priceM];
        
        [coverM addSubview:self.middleLabel];
        [self.middleView addSubview:self.middlePic];
        [self.middleView addSubview:coverM];
        [self.middleView addSubview:self.priceCoverM];
        [self.middleView addSubview:self.btnM];

        [self.contentView addSubview:self.middleView];
        
        self.rightView = [[[UIView alloc] initWithFrame:CGRectMake(222, 12, 74, 74)] autorelease];
        self.rightView.backgroundColor = [UIColor colorWithRed:158/255.0 green:138/255.0 blue:109/255.0 alpha:1.0];
        self.rightView.clipsToBounds = NO;
        [self.rightView.layer setCornerRadius:3.0f];
        
        self.rightPic = [[[AsyncImageView alloc] initWithFrame:CGRectMake(5, 5, 64, 64)] autorelease];
        
        self.btnR = [UIButton buttonWithType:UIButtonTypeCustom];
        self.btnR.frame = CGRectMake(5, 5, 64, 64);
        self.btnR.backgroundColor = [UIColor clearColor];
        
        UIView *coverR = [[[UIView alloc] initWithFrame:CGRectMake(0, 60, 74, 14)] autorelease];
        coverR.backgroundColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:0.4];
        coverR.clipsToBounds = NO;
        [coverR.layer setCornerRadius:3.0f];
        
        self.rightLabel = [[[UILabel alloc] initWithFrame:CGRectMake(2, 0, 70, 14)] autorelease];
        self.rightLabel.backgroundColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:0.4];
        self.rightLabel.textAlignment = UITextAlignmentCenter;
        self.rightLabel.font = [UIFont systemFontOfSize:12.0f];
        self.rightLabel.textColor = [UIColor whiteColor];
        
        self.priceCoverR = [[[UIView alloc] initWithFrame:CGRectMake(-4, 10, 18, 20)] autorelease];
        self.priceCoverR.backgroundColor = [UIColor clearColor];
        
        leftSide = [[[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 5, 20)] autorelease];
        leftSide.image = [UIImage imageNamed:@"ribbon_l.png"];
        leftSide.tag = 1;
        
        middleSide = [[[UIImageView alloc] initWithFrame:CGRectMake(5, 5, 1, 15)] autorelease];
        middleSide.image = [UIImage imageNamed:@"ribbon_m.png"];
        middleSide.contentMode = UIViewContentModeScaleToFill;
        middleSide.tag = 2;
        
        rightSide = [[[UIImageView alloc] initWithFrame:CGRectMake(6, 5, 12, 15)] autorelease];
        rightSide.image = [UIImage imageNamed:@"ribbon_r.png"];
        rightSide.tag = 3;
        
        self.priceR = [[[UILabel alloc] initWithFrame:CGRectMake(0, 5, 6, 15)] autorelease];
        self.priceR.textAlignment = UITextAlignmentLeft;
        self.priceR.textColor = [UIColor whiteColor];
        self.priceR.backgroundColor = [UIColor clearColor];
        self.priceR.font = [UIFont systemFontOfSize:10.0f];
        
        [self.priceCoverR addSubview:leftSide];
        [self.priceCoverR addSubview:middleSide];
        [self.priceCoverR addSubview:rightSide];
        [self.priceCoverR addSubview:self.priceR];
        
        [coverR addSubview:self.rightLabel];
        [self.rightView addSubview:self.rightPic];
        [self.rightView addSubview:coverR];
        [self.rightView addSubview:self.priceCoverR];
        [self.rightView addSubview:self.btnR];
        
        [self.contentView addSubview:self.rightView];
        
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

@end
