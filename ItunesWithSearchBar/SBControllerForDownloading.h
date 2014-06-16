//
//  SBControllerForDownloading.h
//  ItunesWithSearchBar
//
//  Created by Pooja Kamath on 13/06/14.
//  Copyright (c) 2014 Pooja Kamath. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol controllerForDownloadingDelegate

-(void)saveData:(NSArray*)dataDownloaded;

@end

@interface SBControllerForDownloading : NSObject

@property (assign) id delegate;
@property (retain, nonatomic) NSURLConnection *downloadConnection;
@property (retain, nonatomic) NSMutableData *downloadedData;

-(void)downloadDataWithUrl:(NSString *)urlToDownload;
+ (id)sharedManagerForDownloading;
@end
