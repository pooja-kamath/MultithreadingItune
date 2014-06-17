//
//  SBTableViewController.m
//  ItunesWithSearchBar
//
//  Created by Pooja Kamath on 13/06/14.
//  Copyright (c) 2014 Pooja Kamath. All rights reserved.
//

#import "SBTableViewController.h"
#import "SBTableViewCell.h"
#import "SBControllerForData.h"
#import "SBControllerForDownloading.h"
#import "SBData.h"
#import "SBDetailViewController.h"
@interface SBTableViewController ()

@property (retain, nonatomic) IBOutlet UISearchBar *searchBar;
@property (retain, nonatomic) IBOutlet UITableView *myTableView;

@end

@implementation SBTableViewController
@synthesize myTableView;
@synthesize searchBar;
@synthesize activityViewIndicator;
@synthesize dataToDisplay;
- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initializatio
        dataToDisplay=[[SBData alloc]init];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
   
    UISearchDisplayController *searchController = [[UISearchDisplayController alloc] initWithSearchBar:searchBar contentsController:self];
    searchController.delegate = self;
    searchController.searchResultsDataSource = self;
    searchController.searchResultsDelegate = self;
    
    
     _sharedManagerForData = [SBControllerForData sharedManagerForData];
    _sharedManagerForDownloading=[SBControllerForDownloading sharedManagerForDownloading];
    _sharedManagerForData.delegate=self;
      [self.tableView registerClass:[SBTableViewCell class] forCellReuseIdentifier:@"SimpleTableItems"];
      [self.searchDisplayController.searchResultsTableView registerClass:[SBTableViewCell class] forCellReuseIdentifier:@"SimpleTableItems"];
    self.searchBar.delegate=self;
    
}
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    [_sharedManagerForData searchSongForSearchString:self.searchBar.text];
    activityViewIndicator=[[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    
    activityViewIndicator.center=self.view.center;
    //    activityViewIndicator.hidesWhenStopped=YES;
    [activityViewIndicator startAnimating];
    
    [self.view addSubview:activityViewIndicator];

}
- (BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString
{
    
       [_sharedManagerForData searchSongForSearchString:searchString];
   
    activityViewIndicator=[[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    
    activityViewIndicator.center=self.view.center;
    activityViewIndicator.hidesWhenStopped=YES;
    [activityViewIndicator startAnimating];
    
    [self.view addSubview:activityViewIndicator];
    return YES;
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
if( _sharedManagerForData.searchResults.count>0)
{
    [activityViewIndicator stopAnimating];
    // Return the number of rows in the section.
    return _sharedManagerForData.searchResults.count;
}
    else
        return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    SBTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SimpleTableItems"];
    
    [activityViewIndicator stopAnimating];
    
       dataToDisplay=[_sharedManagerForData getDataAtIndex:indexPath.row];
        cell.trackNameLabel.text=dataToDisplay.trackName;
        cell.collectionNameLabel.text=dataToDisplay.collectionName;
        cell.artistNameLabel.text=dataToDisplay.artistName;
        [cell.image setImage:dataToDisplay.image];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 120;
}

-(void)refreshView
{

    [self.searchDisplayController.searchResultsTableView reloadData];
    [self.tableView reloadData];
    
}
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(NSIndexPath *)sender
{
    //send the index value to detail view
    if ([segue.identifier isEqualToString:@"detailViewSegue"])
    {
        SBDetailViewController *detailView = (SBDetailViewController *)segue.destinationViewController;
        detailView.dataToDisplay=[_sharedManagerForData getDataAtIndex: sender.row];
    }
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self performSegueWithIdentifier:@"detailViewSegue" sender:indexPath];
    
}
- (void)dealloc {
    [dataToDisplay release];
    dataToDisplay=nil;
    [searchBar release];
    searchBar=nil;
    [activityViewIndicator release];
    activityViewIndicator=nil;
    [myTableView release];
    myTableView=nil;
    [super dealloc];
}
@end
