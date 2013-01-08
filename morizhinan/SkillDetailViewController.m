//
//  SkillDetailViewController.m
//  morizhinan
//
//  Created by Dai Cloud on 12-7-26.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "SkillDetailViewController.h"
#import "PageSmileView.h"
#import "CustomBarButtonItem.h"

@interface SkillDetailViewController () <PageSmileDataSource>

@end

@implementation SkillDetailViewController

@synthesize skillDetail=_skillDetail;


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    PageSmileView *psv = [[PageSmileView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height) 
                                               withDataSource:self];
    [self.view addSubview:psv];
    self.navigationItem.title = [self.skillDetail objectForKey:@"title"];
    [psv release];
    
    self.navigationItem.hidesBackButton = YES;
    self.navigationItem.leftBarButtonItem = [[[CustomBarButtonItem alloc] initBackBarButtonItemWithTarget:self action:@selector(backAction:)] autorelease];
}


-(void)backAction:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

-(NSInteger)numberOfPages
{
    return [[self.skillDetail objectForKey:@"html"] count];
}

-(UIView *)viewAtIndex:(int)index
{
    NSArray *htmls = [self.skillDetail objectForKey:@"html"];

    UIWebView *web = [[[UIWebView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height)] autorelease];
    NSURL *url = [[NSBundle mainBundle] URLForResource:[htmls objectAtIndex:index] withExtension:@"html"];
    NSString *html = [NSString stringWithContentsOfURL:url encoding:NSUTF8StringEncoding error:nil];
    
    [web loadHTMLString:html baseURL:[url URLByDeletingLastPathComponent]];
    
    return web;
}

@end
