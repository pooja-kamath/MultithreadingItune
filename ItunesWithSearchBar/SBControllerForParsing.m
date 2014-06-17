//
//  SBControllerForParsing.m
//  ItunesWithSearchBar
//
//  Created by Pooja Kamath on 13/06/14.
//  Copyright (c) 2014 Pooja Kamath. All rights reserved.
//

#import "SBControllerForParsing.h"

@implementation SBControllerForParsing
@synthesize delegate;
@synthesize parseQueue;
+ (id)sharedManagerForParsing {
    static SBControllerForParsing *sharedMyManagerForParsing = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{ sharedMyManagerForParsing = [[self alloc] init];});
    
    return sharedMyManagerForParsing;
}
- (instancetype)init
{
    self = [super init];
    if (self) {
        parseQueue = dispatch_queue_create("parse", NULL);
    }
    return self;
}
-(void)parseData:(NSData *)data
{
    
      NSMutableArray *arrayWithData=[[[NSMutableArray alloc]init]autorelease];
    
    //to put a block on a queue
    dispatch_async (parseQueue,^{
        NSLog(@"%@",data);
        NSError* error;
        NSDictionary* json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
        NSArray *jsonArrayContainingDictionary= [json objectForKey:@"results"];
        for(int i=0;i<jsonArrayContainingDictionary.count;i++)
        {
            NSDictionary *dictionary = [jsonArrayContainingDictionary objectAtIndex:i];
            SBData *data=[[SBData alloc]init];
            data.trackName=[dictionary objectForKey:@"trackName"];
            data.collectionName=[dictionary objectForKey:@"collectionName"];
            data.artistName=[dictionary objectForKey:@"artistName"];
            data.country=[dictionary objectForKey:@"country"];
            
            data.genereName=[dictionary objectForKey:@"primaryGenreName"];
            NSURL *url = [[NSURL alloc] initWithString:[dictionary objectForKey:@"artworkUrl100"]];
            NSData *imgdata = [NSData dataWithContentsOfURL:url];
            data.image=[[[UIImage alloc]initWithData:imgdata]autorelease];
            [arrayWithData addObject:data];
            NSLog(@"%@",dictionary);
            [data release];
            [url release];
           
        }
         [delegate saveData:arrayWithData];
        
    });
   
         
   
}
- (void)dealloc
{
    [parseQueue release];
    [super dealloc];
}
@end
