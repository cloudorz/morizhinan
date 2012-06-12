//
//  DisasterListViewController.m
//  morizhinan
//
//  Created by Dai Cloud on 12-6-7.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "DisasterListViewController.h"
#import "DetailWebViewController.h"
#import "CustomBarButtonItem.h"

@interface DisasterListViewController ()

@end

@implementation DisasterListViewController

- (void)dealloc
{
    [_disasters release];
    [super dealloc];
}

- (NSArray *)disasters
{
    if (_disasters == nil){
        // read the plist loud category configure
        NSString *myFile = [[NSBundle mainBundle] pathForResource:@"disasters" ofType:@"plist"];
        NSDictionary *disasterDict = [NSDictionary dictionaryWithContentsOfFile:myFile];
        NSArray *sortedArray = [[disasterDict allValues] sortedArrayUsingComparator:^NSComparisonResult(NSDictionary *d1, NSDictionary *d2){
            int dnum1 = [[d1 objectForKey:@"no"] intValue];
            int dnum2 = [[d2 objectForKey:@"no"] intValue];
            return dnum1 > dnum2;
        }];
        
        _disasters = [[NSArray alloc] initWithArray: sortedArray]; 

        
    }
    
    return _disasters;
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
//    [self.view insertSubview:[[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"menubg.png"]] autorelease] 
//                belowSubview:self.tableView];
    self.tableView.backgroundView = [[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"menubg.png"]] autorelease];
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

-(void)backAction:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
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
    return self.disasters.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    // Configure the cell...
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier] autorelease];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.selectionStyle = UITableViewCellSelectionStyleGray;
    }
    
    NSDictionary *d = [self.disasters objectAtIndex:indexPath.row];
    
    cell.imageView.image = [UIImage imageNamed:@"compassi.png"];
//    cell.imageView.image = [UIImage imageNamed:[d objectForKey:@"logo"]];
    cell.textLabel.text = [d objectForKey:@"title"];
    cell.detailTextLabel.text = [d objectForKey:@"brief"];
    
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    
    DetailWebViewController *detailViewController = [[DetailWebViewController alloc] initWithNibName:@"DetailWebViewController" bundle:nil];
    NSDictionary *d = [self.disasters objectAtIndex:indexPath.row];
    detailViewController.htmlFileName = [d objectForKey:@"html"];
    detailViewController.navigationItem.title = [d objectForKey:@"title"];

    [self.navigationController pushViewController:detailViewController animated:YES];
    [detailViewController release];
     
}

@end
