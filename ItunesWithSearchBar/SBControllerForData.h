//
//  SBControllerForData.h
//  ItunesWithSearchBar
//
//  Created by Pooja Kamath on 13/06/14.
//  Copyright (c) 2014 Pooja Kamath. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SBControllerForParsing.h"
#import "SBData.h"
@protocol managerForDataDelegate
-(void) refreshView;
@end

@interface SBControllerForData : NSObject <parseDelegate>
@property (retain) NSMutableArray *searchResults;
@property (assign) id delegate;

+ (id)sharedManagerForData;
-(void)searchSongForSearchString:(NSString *)searchString;
-(SBData *)getDataAtIndex:(NSInteger )index;

@end
