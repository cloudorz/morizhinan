//
//  ItemListViewController.m
//  morizhinan
//
//  Created by Dai Cloud on 12-6-9.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "ItemListViewController.h"
#import "MRItemCell.h"
#import "DetailWebViewController.h"
#import "CustomBarButtonItem.h"

@interface ItemListViewController ()

@end

@implementation ItemListViewController

- (void)dealloc
{
    [_items release];
    [super dealloc];
}

- (NSArray *)items
{
    if (_items == nil){
        // read the plist loud category configure
        NSString *myFile = [[NSBundle mainBundle] pathForResource:@"items" ofType:@"plist"];
        NSDictionary *itemDict = [NSDictionary dictionaryWithContentsOfFile:myFile];
        NSArray *sortedArray = [[itemDict allValues] sortedArrayUsingComparator:^NSComparisonResult(NSDictionary *d1, NSDictionary *d2){
            int dnum1 = [[d1 objectForKey:@"no"] intValue];
            int dnum2 = [[d2 objectForKey:@"no"] intValue];
            return dnum1 > dnum2;
        }];
        
        _items = [[NSArray alloc] initWithArray: sortedArray]; 
        
        
    }
    
    return _items;
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
    return (self.items.count / 3) + (self.items.count % 3 > 0 ? 1 : 0);
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    MRItemCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    // Configure the cell...
    if (cell == nil) {
        cell =  [[[MRItemCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        [cell.btnL addTarget:self action:@selector(itemBtnAction:) forControlEvents:UIControlEventTouchUpInside];
        [cell.btnM addTarget:self action:@selector(itemBtnAction:) forControlEvents:UIControlEventTouchUpInside];
        [cell.btnR addTarget:self action:@selector(itemBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    int l = indexPath.row*3 + 0;
    if (l < self.items.count) {
        cell.leftView.hidden = NO;
        cell.btnL.enabled = YES;
        cell.btnL.tag = l;
        
        NSDictionary *itemL = [self.items objectAtIndex:l];
        [cell.leftPic loadImage:[itemL objectForKey:@"logo_url"]];
        cell.leftLabel.text = [itemL objectForKey:@"name"];
        NSString *price = [itemL objectForKey:@"price"];
        CGSize priceSize = [price sizeWithFont:[UIFont systemFontOfSize:10.0]];
        
        UIImageView *mLabelImage = (UIImageView *)[cell.priceCoverL viewWithTag:2];
        UIImageView *rLabelImage = (UIImageView *)[cell.priceCoverL viewWithTag:3];
        
        CGRect priceCoverLFrame = cell.priceCoverL.frame;
        CGRect priceLabelLFrame = cell.priceL.frame;
        CGRect rLabelImageFrame = rLabelImage.frame;
        CGRect mLabelImageFrame = mLabelImage.frame;
        
        priceCoverLFrame.size.width = priceSize.width + 12;
        priceLabelLFrame.size.width = priceSize.width;
        rLabelImageFrame.origin.x = priceSize.width;
        mLabelImageFrame.size.width = priceSize.width - 5;
        
        cell.priceCoverL.frame = priceCoverLFrame;
        cell.priceL.frame = priceLabelLFrame;
        mLabelImage.frame = mLabelImageFrame;
        rLabelImage.frame = rLabelImageFrame;
        
        cell.priceL.text = price;

        
    } else {
        cell.leftView.hidden = YES;
        cell.btnL.enabled = NO;
    }
    
    int m = indexPath.row*3 + 1;
    if (m < self.items.count) {
        cell.middleView.hidden = NO;
        cell.btnM.enabled = YES;
        cell.btnM.tag = m;
        
        NSDictionary *itemM = [self.items objectAtIndex:m];
        [cell.middlePic loadImage:[itemM objectForKey:@"logo_url"]];
        cell.middleLabel.text = [itemM objectForKey:@"name"];
        NSString *price = [itemM objectForKey:@"price"];
        CGSize priceSize = [price sizeWithFont:[UIFont systemFontOfSize:10.0]];
        
        UIImageView *mLabelImage = (UIImageView *)[cell.priceCoverM viewWithTag:2];
        UIImageView *rLabelImage = (UIImageView *)[cell.priceCoverM viewWithTag:3];
        
        CGRect priceCoverLFrame = cell.priceCoverM.frame;
        CGRect priceLabelLFrame = cell.priceM.frame;
        CGRect rLabelImageFrame = rLabelImage.frame;
        CGRect mLabelImageFrame = mLabelImage.frame;
        
        priceCoverLFrame.size.width = priceSize.width + 12;
        priceLabelLFrame.size.width = priceSize.width;
        rLabelImageFrame.origin.x = priceSize.width;
        mLabelImageFrame.size.width = priceSize.width - 5;
        
        cell.priceCoverM.frame = priceCoverLFrame;
        cell.priceM.frame = priceLabelLFrame;
        mLabelImage.frame = mLabelImageFrame;
        rLabelImage.frame = rLabelImageFrame;
        
        cell.priceM.text = price;

    } else {
        cell.middleView.hidden = YES;
        cell.btnM.enabled = NO;
    }
    
    int r = indexPath.row*3 + 2;
    if (r < self.items.count) {
        cell.rightView.hidden = NO;
        cell.btnR.enabled = YES;
        cell.btnR.tag = r;
        
        NSDictionary *itemR = [self.items objectAtIndex:r];
        [cell.rightPic loadImage:[itemR objectForKey:@"logo_url"]];
        cell.rightLabel.text = [itemR objectForKey:@"name"];
        
        NSString *price = [itemR objectForKey:@"price"];
        CGSize priceSize = [price sizeWithFont:[UIFont systemFontOfSize:10.0]];
        
        UIImageView *mLabelImage = (UIImageView *)[cell.priceCoverR viewWithTag:2];
        UIImageView *rLabelImage = (UIImageView *)[cell.priceCoverR viewWithTag:3];
        
        CGRect priceCoverLFrame = cell.priceCoverR.frame;
        CGRect priceLabelLFrame = cell.priceR.frame;
        CGRect rLabelImageFrame = rLabelImage.frame;
        CGRect mLabelImageFrame = mLabelImage.frame;
        
        priceCoverLFrame.size.width = priceSize.width + 12;
        priceLabelLFrame.size.width = priceSize.width;
        rLabelImageFrame.origin.x = priceSize.width;
        mLabelImageFrame.size.width = priceSize.width - 5;
        
        cell.priceCoverR.frame = priceCoverLFrame;
        cell.priceR.frame = priceLabelLFrame;
        mLabelImage.frame = mLabelImageFrame;
        rLabelImage.frame = rLabelImageFrame;
        
        cell.priceR.text = price;

    } else {
        cell.rightView.hidden = YES;
        cell.btnR.enabled = NO;
    }
    
    return cell;
}

-(void)itemBtnAction:(id)sender
{
    UIButton *btn = (UIButton *)sender;
    
    [MobClick event:@"click_buy" acc:1];
    
    DetailWebViewController *dwvc = [[DetailWebViewController alloc] initWithNibName:@"DetailWebViewController" bundle:nil];
    NSDictionary *i = [self.items objectAtIndex:btn.tag];
    dwvc.url = [i objectForKey:@"item_url"];
    dwvc.navigationItem.title = [i objectForKey:@"name"];
//    dwvc.url = @"http://m.taobao.com/";
    [self.navigationController pushViewController:dwvc animated:YES];
    [dwvc release];
    
}

#pragma mark - Table view delegate

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
