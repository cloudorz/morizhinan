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
-(void)justifyBackNext;
- (UIScrollView *)defaultScrollView;
@end

@implementation DetailWebViewController

@synthesize htmlFileName=_htmlFileName;
@synthesize contentWebView=_contentWebView;
@synthesize url=_url;
@synthesize loading=_loading;
@synthesize controlBar=_controlBar;
@synthesize prev=_prev;
@synthesize next=_next;
@synthesize stop=_stop;
@synthesize refresh=_refresh;

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
    
    UIScrollView *uscl = [self defaultScrollView];
    
    uscl.alwaysBounceHorizontal = NO;
    uscl.alwaysBounceVertical = NO;
    
    [self.loading stopAnimating];
    
    self.navigationItem.hidesBackButton = YES;
    self.navigationItem.leftBarButtonItem = [[[CustomBarButtonItem alloc] initBackBarButtonItemWithTarget:self action:@selector(backAction:)] autorelease];

}

- (UIScrollView *)defaultScrollView 
{
    UIScrollView *scrollView = nil;
    
    NSString *currSysVer = [[UIDevice currentDevice] systemVersion];
    if ([currSysVer compare:@"5.0" options:NSNumericSearch] != NSOrderedAscending) {
        scrollView = self.contentWebView.scrollView;
    } else {
        for (UIView *subview in [self.contentWebView subviews]) {
            if ([subview isKindOfClass:[UIScrollView class]]) {
                scrollView = (UIScrollView *)subview;
                break;
            }
        }
        
        if (scrollView == nil) {
            NSLog(@"Couldn’t get default scrollview!");
        }
    }
    return scrollView;
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
            self.controlBar.hidden = NO;
        }
    }

    [self justifyBackNext];
}

-(void)justifyBackNext
{
    if (self.contentWebView.canGoBack) {
        self.prev.enabled = YES;
    } else {
        self.prev.enabled = NO;
    }
    
    if (self.contentWebView.canGoForward) {
        self.next.enabled = YES;
    } else {
        self.next.enabled = NO;
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
    self.refresh.enabled = NO;
    self.stop.enabled = YES;
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    [self.loading stopAnimating];
    self.refresh.enabled = YES;
    self.stop.enabled = NO;
    
    [self justifyBackNext];
    
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    NSLog(@"error for webview: %@", [error description]);
//    if (102 != [error code]){
//        [Utils warningNotification:[error localizedDescription]];
//    }
    [self.loading stopAnimating];
    self.refresh.enabled = YES;
    self.stop.enabled = NO;
    
    [self justifyBackNext];
}

-(IBAction)prevAction:(id)sender
{
    [self.contentWebView goBack];
}

-(IBAction)nextAction:(id)sender
{
    [self.contentWebView goForward];
}

-(IBAction)refreshAction:(id)sender
{
    [self.contentWebView reload];
}

-(IBAction)stopAction:(id)sender
{
    [self.contentWebView stopLoading];
}

@end
