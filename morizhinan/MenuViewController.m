//
//  MenuViewController.m
//  morizhinan
//
//  Created by Dai Cloud on 12-6-7.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "MenuViewController.h"
#import "DisasterListViewController.h"
#import "CompassViewController.h"
#import "CountDownViewController.h"
#import "GlimViewController.h"
#import "SkillListViewController.h"
#import "ItemListViewController.h"
#import "DetailWebViewController.h"

@interface MenuViewController ()

@end

@implementation MenuViewController

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
     self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"menubg.png"]];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

-(IBAction)disasterAction:(id)sender
{
//    NSLog(@"disaster list");
    DisasterListViewController *dlvc = [[DisasterListViewController alloc] initWithNibName:@"DisasterListViewController" bundle:nil];
    dlvc.navigationItem.title = @"灾难逃生";
    [self.navigationController pushViewController:dlvc animated:YES];
    [dlvc release];
}

-(IBAction)skillAction:(id)sender
{
//    NSLog(@"skill action");
    SkillListViewController *slvc = [[SkillListViewController alloc] initWithNibName:@"SkillListViewController" bundle:nil];
    slvc.navigationItem.title = @"技能";
    [self.navigationController pushViewController:slvc animated:YES];
    [slvc release];
}

-(IBAction)itemAction:(id)sender
{
//    NSLog(@"item action");
    ItemListViewController *ilvc = [[ItemListViewController alloc] initWithNibName:@"ItemListViewController" bundle:nil];
    ilvc.navigationItem.title = @"必备物品";
    [self.navigationController pushViewController:ilvc animated:YES];
    [ilvc release];
}

-(IBAction)ticketAction:(id)sender
{
//    NSLog(@"ticket action");
    DetailWebViewController *dwvc = [[DetailWebViewController alloc] initWithNibName:@"DetailWebViewController" bundle:nil];
    dwvc.url = @"http://2012zhinan.sinaapp.com/ticket.php";
    dwvc.navigationItem.title = @"领取船票";
    [self.navigationController pushViewController:dwvc animated:YES];
    [dwvc release];
}

-(IBAction)compassAction:(id)sender
{
//    NSLog(@"compass action");
    CompassViewController *cvc = [[CompassViewController alloc] initWithNibName:@"CompassViewController" bundle:nil];
    cvc.navigationItem.title = @"指南针";
    [self.navigationController pushViewController:cvc animated:YES];
    [cvc release];
}

-(IBAction)countDownAction:(id)sender
{
//    NSLog(@"count down");
    CountDownViewController *cdvc = [[CountDownViewController alloc] initWithNibName:@"CountDownViewController" bundle:nil];
    cdvc.navigationItem.title = @"末日倒计时";
    [self.navigationController pushViewController:cdvc animated:YES];
    [cdvc release];
}

-(IBAction)glimAction:(id)sender
{
//    NSLog(@"glim ");
    GlimViewController *gvc = [[GlimViewController alloc] initWithNibName:@"GlimViewController" bundle:nil];
    gvc.navigationItem.title = @"应急手电";
    [self.navigationController pushViewController:gvc animated:YES];
    [gvc release];
}

//-(IBAction)shareAction:(id)sender
//{
//    NSLog(@"share");
//}

-(IBAction)storyAction:(id)sender
{
    DetailWebViewController *dwvc = [[DetailWebViewController alloc] initWithNibName:@"DetailWebViewController" bundle:nil];
    dwvc.htmlFileName = @"story2012";
    dwvc.navigationItem.title = @"末日传说";
    [self.navigationController pushViewController:dwvc animated:YES];
    [dwvc release];
}

@end
