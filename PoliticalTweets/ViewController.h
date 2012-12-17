//
//  ViewController.h
//  PoliticalTweets
//
//  Created by Vig Sachidananda on 9/21/12.
//  Copyright (c) 2012 Vig Sachidananda. All rights reserved.
//

#define tweetQueue dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)
#define latestTweetsURL [NSURL URLWithString:@"http://search.twitter.com/search.json?q=election&result_type=recent"]

#import <UIKit/UIKit.h>
#import <Twitter/Twitter.h>

@interface ViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

{
    NSMutableArray *tableTitles;
    NSMutableArray *tableSubTitles;
    NSMutableArray *tableImages;
    NSMutableArray *latestTweets;
    IBOutlet UITableView *tableView;
    IBOutlet UIBarButtonItem *twitterButton;
    IBOutlet UIBarButtonItem *reloadButton;
    BOOL bannerIsVisible;
    NSInteger count;
}

@property (nonatomic, strong) NSMutableArray *tableTitles;
@property (nonatomic, strong) NSMutableArray *tableSubTitles;
@property (nonatomic, strong) NSMutableArray *tableImages;
@property (nonatomic, strong) NSMutableArray *latestTweets;
@property (nonatomic, weak) IBOutlet UITableView *tableView;
@property (nonatomic) BOOL bannerIsVisible;
@property (nonatomic) NSInteger count;
@property (nonatomic) NSInteger obamaCount;
@property (nonatomic) NSInteger romneyCount;



- (IBAction)twitter:(id)sender;
- (IBAction)reload;



@end
