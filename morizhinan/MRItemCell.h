//
//  MRItemCell.h
//  morizhinan
//
//  Created by Dai Cloud on 12-6-9.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AsyncImageView.h"

@interface MRItemCell : UITableViewCell

@property (strong, nonatomic) UIButton *btnL, *btnM, *btnR;
@property (strong, nonatomic) UIView *leftView, *middleView, *rightView;
@property (strong, nonatomic) AsyncImageView *leftPic, *middlePic, *rightPic;
@property (strong, nonatomic) UILabel *leftLabel, *middleLabel, *rightLabel;
@property (strong, nonatomic) UIView *priceCoverL, *priceCoverM, *priceCoverR;
@property (strong, nonatomic) UILabel *priceL, *priceM, *priceR;

@end
