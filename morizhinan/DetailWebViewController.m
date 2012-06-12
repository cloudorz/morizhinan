//
//  DetailWebViewController.m
//  morizhinan
//
//  Created by Dai Cloud on 12-6-9.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "DetailWebViewController.h"
#import "CustomBarButtonItem.h"

@interface DetailWebViewController ()

@end

@implementation DetailWebViewController

@synthesize htmlFileName=_htmlFileName;
@synthesize contentWebView=_contentWebView;
@synthesize url=_url;
@synthesize loading=_loading;

- (void)dealloc
{
    [_htmlFileName release];
    [_contentWebView release];
    [_url release];
    [_loading release];
    [super dealloc];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.contentWebView.scrollView.alwaysBounceHorizontal = NO;
    self.contentWebView.scrollView.alwaysBounceVertical = NO;
    
    [self.loading stopAnimating];
    
    self.navigationItem.hidesBackButton = YES;
    self.navigationItem.leftBarButtonItem = [[[CustomBarButtonItem alloc] initBackBarButtonItemWithTarget:self action:@selector(backAction:)] autorelease];

}

-(void)backAction:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    if (self.htmlFileName != nil) {
        NSURL *url = [[NSBundle mainBundle] URLForResource:self.htmlFileName withExtension:@"html"];
        NSString *html = [NSString stringWithContentsOfURL:url encoding:NSUTF8StringEncoding error:nil];
        
        [self.contentWebView loadHTMLString:html baseURL:[url URLByDeletingLastPathComponent]];
    }else {
        if (self.url != nil) {
            [self.contentWebView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:self.url]]];
        }
    }

}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - web view delegates
- (void)webViewDidStartLoad:(UIWebView *)webView
{
    [self.loading startAnimating];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    [self.loading stopAnimating];
    
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    NSLog(@"error for webview: %@", [error description]);
//    if (102 != [error code]){
//        [Utils warningNotification:[error localizedDescription]];
//    }
    [self.loading stopAnimating];
}


@end
