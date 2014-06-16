//
//  SBControllerForParsing.h
//  ItunesWithSearchBar
//
//  Created by Pooja Kamath on 13/06/14.
//  Copyright (c) 2014 Pooja Kamath. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SBData.h"
@interface SBControllerForParsing : NSObject

+ (id)sharedManagerForParsing;
-(NSMutableArray *)parseData:(NSData *)data;
@end
