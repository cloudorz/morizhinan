//
//  PagePhotosView.h
//  PagePhotosDemo
//
//  Created by junmin liu on 10-8-23.
//  Copyright 2010 Openlab. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PageSmileDataSource.h"

@interface PageSmileView : UIView<UIScrollViewDelegate> {
	UIScrollView *scrollView;
	UIPageControl *pageControl;
	
	id<PageSmileDataSource> dataSource;
	
	// To be used when scrolls originate from the UIPageControl
    BOOL pageControlUsed;
}

@property (nonatomic, assign) id<PageSmileDataSource> dataSource;
@property (nonatomic, strong) NSMutableArray *smileViews;

- (IBAction)changePage:(id)sender;

- (id)initWithFrame:(CGRect)frame withDataSource:(id<PageSmileDataSource>)_dataSource;

@end
