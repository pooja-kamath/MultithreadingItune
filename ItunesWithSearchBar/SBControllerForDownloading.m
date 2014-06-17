//
//  SBControllerForDownloading.m
//  ItunesWithSearchBar
//
//  Created by Pooja Kamath on 13/06/14.
//  Copyright (c) 2014 Pooja Kamath. All rights reserved.
//

#import "SBControllerForDownloading.h"
#import "SBControllerForParsing.h"
 bool didBeginDownload;
@implementation SBControllerForDownloading


+(id)sharedManagerForDownloading{
    static SBControllerForDownloading *sharedMyManagerForDownloading = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{ sharedMyManagerForDownloading = [[self alloc] init];});
    
    return sharedMyManagerForDownloading;
}

-(void)downloadDataWithUrl:(NSString *)urlToDownload
{
    if(didBeginDownload == YES)
    {
        [_downloadConnection cancel];
    }
    if(_downloadedData )
    {
        [_downloadedData release];
        _downloadedData=nil;
        
    }
          _downloadedData = [[NSMutableData alloc] init];
        _downloadConnection = [NSURLConnection connectionWithRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:urlToDownload]]delegate:self];
    
}
-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    didBeginDownload=YES;
}
- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    didBeginDownload=YES;
    //append the data that is recieved to previously recieved data
    [_downloadedData appendData:data];
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    NSLog(@"didFailWithError");
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    didBeginDownload=NO;
    NSLog(@"%@",_downloadedData);
    [[SBControllerForParsing sharedManagerForParsing ]parseData:_downloadedData];
    [_downloadedData release];
    _downloadedData=nil;
    
}
- (void)dealloc
{
//    [_downloadConnection release];
//    _downloadConnection=nil;
    [_downloadedData release];
    _downloadedData=nil;
    [super dealloc];
}
@end
