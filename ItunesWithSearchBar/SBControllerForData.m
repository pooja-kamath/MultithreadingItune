//
//  SBControllerForData.m
//  ItunesWithSearchBar
//
//  Created by Pooja Kamath on 13/06/14.
//  Copyright (c) 2014 Pooja Kamath. All rights reserved.
//

#import "SBControllerForData.h"
#import "SBData.h"
#import "SBControllerForDownloading.h"
@implementation SBControllerForData
@synthesize  searchResults;
+ (id)sharedManagerForData {
    static SBControllerForData *sharedMyManagerForData = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{ sharedMyManagerForData = [[self alloc] init];});
    
    return sharedMyManagerForData;
}
int count;
- (instancetype)init
{
    self = [super init];
    if (self) {
        searchResults=[[NSMutableArray alloc]init];
        
    }
    return self;
}

-(void)searchSongForSearchString:(NSString *)searchString
{
    if(count ==0)
    {
     SBControllerForParsing *sharedManagerForParsing= [SBControllerForParsing sharedManagerForParsing];
    sharedManagerForParsing.delegate=self;
    NSString * initialStringToAppendToUrl=@"https://itunes.apple.com/search?term=";
    NSString *finalStringToAppendToUrl=@"&entity=musicVideo&limit=40";
    searchString=[searchString stringByReplacingOccurrencesOfString:@" " withString:@"+"];
    NSString *searchUrl=[initialStringToAppendToUrl stringByAppendingString:searchString];
    searchUrl=[searchUrl stringByAppendingString:finalStringToAppendToUrl];
    [[SBControllerForDownloading sharedManagerForDownloading]downloadDataWithUrl:searchUrl];
    }
    count++;
 }

-(SBData *)getDataAtIndex:(NSInteger)index
{
    return [searchResults objectAtIndex:index];
}
-(void)saveData:(NSArray*)dataDownloaded
{
    count=0;
    [searchResults removeAllObjects];
   [ searchResults addObjectsFromArray:dataDownloaded];

    [_delegate refreshView];
}

- (void)dealloc
{
    [searchResults release];
    searchResults=nil;
    [super dealloc];
}
@end
