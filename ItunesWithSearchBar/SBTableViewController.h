//
//  SBTableViewController.h
//  ItunesWithSearchBar
//
//  Created by Pooja Kamath on 13/06/14.
//  Copyright (c) 2014 Pooja Kamath. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SBControllerForData.h"
@interface SBTableViewController : UITableViewController <UISearchBarDelegate,UISearchDisplayDelegate>

@property (assign) SBControllerForData *sharedManagerForData;
@property(assign) SBControllerForParsing *sharedManagerForDownloading;
@property (assign)UIActivityIndicatorView *activityViewIndicator;
@property (assign)SBData *dataToDisplay;
@end
