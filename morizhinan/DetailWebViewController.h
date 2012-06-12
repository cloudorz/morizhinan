//
//  DetailWebViewController.h
//  morizhinan
//
//  Created by Dai Cloud on 12-6-9.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailWebViewController : UIViewController <UIWebViewDelegate>

@property (strong, nonatomic) IBOutlet UIWebView *contentWebView;
@property (strong, nonatomic) NSString *htmlFileName;
@property (strong, nonatomic) NSString *url;
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *loading;

@end
