//
//  SBControllerForParsing.h
//  ItunesWithSearchBar
//
//  Created by Pooja Kamath on 13/06/14.
//  Copyright (c) 2014 Pooja Kamath. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SBData.h"
@protocol parseDelegate

-(void)saveData:(NSArray*)dataDownloaded;

@end
@interface SBControllerForParsing : NSObject
@property (assign)id delegate;
+ (id)sharedManagerForParsing;
-(void)parseData:(NSData *)data;
@property (assign)dispatch_queue_t parseQueue;

@end
