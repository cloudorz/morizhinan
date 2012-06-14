//
//  InfoListViewController.m
//  morizhinan
//
//  Created by Dai Cloud on 12-6-12.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "InfoListViewController.h"
#import "CustomBarButtonItem.h"

@interface InfoListViewController ()

@end

@implementation InfoListViewController

- (void)dealloc
{
    [_infolist release];
    [super dealloc];
}

-(NSArray *)infolist
{
    if (_infolist == nil) {
        _infolist = [[NSArray alloc] initWithObjects:
                     [[[NSArray alloc] initWithObjects:@"给我们评分", @"关于我们", nil] autorelease], 
                     nil];
    }
    return _infolist;
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
    return self.infolist.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    // Return the number of rows in the section.
    return [[self.infolist objectAtIndex:section] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    // Configure the cell...
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
        cell.selectionStyle =  UITableViewCellSelectionStyleGray;
    }
    
    cell.textLabel.text = [[self.infolist objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
    
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
//    // Navigation logic may go here. Create and push another view controller.
//    NSString *label = [[self.infolist objectAtIndex:indexPath.section] indexPath.row];
//    if ([label isEqualToString:@"给我们评分"]) {
//        <#statements#>
//    } else if {
//        <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
//        // ...
//        // Pass the selected object to the new view controller.
//        [self.navigationController pushViewController:detailViewController animated:YES];
//        [detailViewController release];
//    }

     
}

@end
