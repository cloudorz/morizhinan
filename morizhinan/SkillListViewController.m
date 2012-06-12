//
//  SkillListViewController.m
//  morizhinan
//
//  Created by Dai Cloud on 12-6-9.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "SkillListViewController.h"
#import "MRSkillCell.h"
#import "DetailWebViewController.h"
#import "CustomBarButtonItem.h"

@interface SkillListViewController ()

@end

@implementation SkillListViewController

- (void)dealloc
{
    [_skills release];
    [super dealloc];
}

- (NSArray *)skills
{
    if (_skills == nil){
        // read the plist loud category configure
        NSString *myFile = [[NSBundle mainBundle] pathForResource:@"skills" ofType:@"plist"];
        NSDictionary *skillDict = [NSDictionary dictionaryWithContentsOfFile:myFile];
        NSArray *sortedArray = [[skillDict allValues] sortedArrayUsingComparator:^NSComparisonResult(NSDictionary *d1, NSDictionary *d2){
            int dnum1 = [[d1 objectForKey:@"no"] intValue];
            int dnum2 = [[d2 objectForKey:@"no"] intValue];
            return dnum1 > dnum2;
        }];
        
        _skills = [[NSArray alloc] initWithArray: sortedArray]; 
        
        
    }
    
    return _skills;
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    self.navigationItem.hidesBackButton = YES;
    self.navigationItem.leftBarButtonItem = [[[CustomBarButtonItem alloc] initBackBarButtonItemWithTarget:self action:@selector(backAction:)] autorelease];
//    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"menubg.png"]];
    self.tableView.backgroundView = [[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"menubg.png"]] autorelease];
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

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    // Return the number of rows in the section.
    return (self.skills.count / 3) + (self.skills.count % 3 > 0 ? 1 : 0);
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    MRSkillCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    // Configure the cell...
    if (cell == nil) {
        cell =  [[[MRSkillCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        [cell.btnL addTarget:self action:@selector(skillBtnAction:) forControlEvents:UIControlEventTouchUpInside];
        [cell.btnM addTarget:self action:@selector(skillBtnAction:) forControlEvents:UIControlEventTouchUpInside];
        [cell.btnR addTarget:self action:@selector(skillBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    int l = indexPath.row*3 + 0;
    if (l < self.skills.count) {
        cell.btnL.hidden = NO;
        cell.btnL.enabled = YES;
        cell.btnL.tag = l;
     
        NSDictionary *skillL = [self.skills objectAtIndex:l];
        // set pics TODO
        
    } else {
        cell.btnL.hidden = YES;
        cell.btnL.enabled = NO;
    }
    
    int m = indexPath.row*3 + 1;
    if (m < self.skills.count) {
        cell.btnM.hidden = NO;
        cell.btnM.enabled = YES;
        cell.btnM.tag = m;
        
        NSDictionary *skillM = [self.skills objectAtIndex:m];
        // set pics TODO
    } else {
        cell.btnM.hidden = YES;
        cell.btnM.enabled = NO;
    }
    
    int r = indexPath.row*3 + 2;
    if (r < self.skills.count) {
        cell.btnR.hidden = NO;
        cell.btnR.enabled = YES;
        cell.btnR.tag = r;
        
        NSDictionary *skillR = [self.skills objectAtIndex:r];
        // set pics TODO
    } else {
        cell.btnR.hidden = YES;
        cell.btnR.enabled = NO;
    }
    
    return cell;
}

-(void)skillBtnAction:(id)sender
{
    UIButton *btn = (UIButton *)sender;
    
    DetailWebViewController *dwvc = [[DetailWebViewController alloc] initWithNibName:@"DetailWebViewController" bundle:nil];
    NSDictionary *s = [self.skills objectAtIndex:btn.tag];
    dwvc.htmlFileName = [s objectForKey:@"html"];
    dwvc.navigationItem.title = [s objectForKey:@"title"];
    [self.navigationController pushViewController:dwvc animated:YES];
    [dwvc release];

}

#pragma mark - Table view delegate
//
//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    // Navigation logic may go here. Create and push another view controller.
//    /*
//     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
//     // ...
//     // Pass the selected object to the new view controller.
//     [self.navigationController pushViewController:detailViewController animated:YES];
//     [detailViewController release];
//     */
//}

@end