//
//  SBTableViewCell.m
//  ItunesWithSearchBar
//
//  Created by Pooja Kamath on 13/06/14.
//  Copyright (c) 2014 Pooja Kamath. All rights reserved.
//

#import "SBTableViewCell.h"

@implementation SBTableViewCell
@synthesize artistNameLabel;
@synthesize trackNameLabel;
@synthesize collectionNameLabel;
@synthesize priceLabel;
@synthesize image;
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        
       
        trackNameLabel = [[UILabel alloc] initWithFrame: CGRectZero];
         collectionNameLabel.font=[UIFont fontWithName:@"TimesNewRomanPS-ItalicMT" size:14];
        [trackNameLabel setTextAlignment:NSTextAlignmentCenter];
        [trackNameLabel setTextColor: [UIColor blackColor]];
        [self addSubview: trackNameLabel];
        
     
        collectionNameLabel = [[UILabel alloc] initWithFrame: CGRectZero];
        collectionNameLabel.font=[UIFont fontWithName:@"TimesNewRomanPS-ItalicMT" size:12];
        [collectionNameLabel setTextAlignment:NSTextAlignmentCenter];
        [collectionNameLabel setTextColor: [UIColor blackColor]];
        [self addSubview:collectionNameLabel];
        
        
       
        priceLabel = [[UILabel alloc] initWithFrame: CGRectZero];
        priceLabel.font=[UIFont fontWithName:@"TimesNewRomanPS-ItalicMT" size:14];
        [priceLabel setTextAlignment:NSTextAlignmentCenter];
        [priceLabel setText: @"My " ];
        [priceLabel setTextColor: [UIColor blackColor]];
        [self addSubview:priceLabel];
        
    
        artistNameLabel = [[UILabel alloc] initWithFrame: CGRectZero];
        artistNameLabel.font=[UIFont fontWithName:@"TimesNewRomanPS-ItalicMT" size:14];
        [artistNameLabel setTextAlignment:NSTextAlignmentCenter];
        [artistNameLabel setText: @"My Label" ];
        [artistNameLabel setTextColor: [UIColor blackColor]];
        [self addSubview:artistNameLabel];
        
        image=[[UIImageView alloc]initWithFrame:CGRectZero];
        [self addSubview:image];
        
        
        
    }
    return self;
}
-(void)layoutSubviews
{
    UIInterfaceOrientation orientation = [UIApplication sharedApplication].statusBarOrientation;
    if (UIInterfaceOrientationIsPortrait(orientation))
    {
    [trackNameLabel setFrame:CGRectMake( 120, 5, 200, 30 )];
    [collectionNameLabel setFrame:CGRectMake(120, 30, 200, 15)];
  
    [artistNameLabel setFrame:CGRectMake(150, 80,150, 15)];
    [image setFrame:CGRectMake(10, 10, 100,100)];
    }
    else
    {
        [trackNameLabel setFrame:CGRectMake( 145, 5, 400, 30 )];
        [collectionNameLabel setFrame:CGRectMake(145, 30, 400, 15)];
       
        [artistNameLabel setFrame:CGRectMake(220, 80,200, 15)];
        [image setFrame:CGRectMake(10, 10, 130,100)];
    }
    
    
}
- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (void)dealloc
{
    [trackNameLabel release];
    trackNameLabel=nil;
   [collectionNameLabel release];
    collectionNameLabel=nil;
    [priceLabel release];
    priceLabel=nil;
   [artistNameLabel release];
    artistNameLabel=nil;
    [image release];
    image=nil;
    [super dealloc];
}

@end
