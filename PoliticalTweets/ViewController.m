//
//  ViewController.m
//  PoliticalTweets
//
//  Created by Vig Sachidananda on 9/21/12.
//  Copyright (c) 2012 Vig Sachidananda. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize tableTitles = _tableTitles;
@synthesize tableSubTitles = _tableSubTitles;
@synthesize tableImages = _tableImages;
@synthesize latestTweets = _latestTweets;
@synthesize tableView = _tableView;
@synthesize bannerIsVisible = _bannerIsVisible;
@synthesize count = _count;
@synthesize obamaCount = _obamaCount;
@synthesize romneyCount = _romneyCount;



#pragma mark - Pre Loaded



- (void)viewDidLoad{
    _tableTitles = [[NSMutableArray alloc]init];
    _tableSubTitles = [[NSMutableArray alloc]init];
    _tableImages = [[NSMutableArray alloc]init];
    _latestTweets = [[NSMutableArray alloc]init];
    _obamaCount = 0;
    [self reload];
    [super viewDidLoad];
    _count=[_tableTitles count];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)fetchedData:(NSData *)responseData {
    NSError* error;
    NSDictionary* json = [NSJSONSerialization
                          JSONObjectWithData:responseData
                          options:kNilOptions
                          error:&error];
    
    _latestTweets = [json objectForKey:@"results"];
    
    int i = 0;
    for (i = 0; i<10; i++)
        
    {
    NSDictionary* tweet = [_latestTweets objectAtIndex:i];
    NSString* tweetText = [tweet objectForKey:@"text"];
        
    [_tableTitles addObject:tweetText];
    NSString* fromUser = [tweet objectForKey:@"from_user"];
    [_tableSubTitles addObject:fromUser];
    NSString* twitterURL = @"twitter.com/";
    NSString* tweetURL = [twitterURL  stringByAppendingString:fromUser];
    [_tableView reloadData];
    }
    _count=[_tableTitles count];


}

#pragma mark - Required UITableView Methods


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath

{
    UITableViewCell *cell = nil;
    cell = [_tableView dequeueReusableCellWithIdentifier:@"Cell"];
    
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier: @"Cell"];
    }
    
    NSDictionary *aTweet = [_latestTweets objectAtIndex:[indexPath row]];
    cell.textLabel.text = [_tableTitles objectAtIndex:indexPath.row];
    cell.detailTextLabel.text = [_tableSubTitles objectAtIndex:indexPath.row];
    NSURL *url = [NSURL URLWithString:[aTweet objectForKey:@"profile_image_url"]];
    NSData *data = [NSData dataWithContentsOfURL:url];
    cell.imageView.image = [UIImage imageWithData:data];
    
    
    cell.textLabel.adjustsFontSizeToFitWidth = YES;
    cell.textLabel.font = [UIFont boldSystemFontOfSize:14];
    cell.detailTextLabel.font = [UIFont systemFontOfSize:12];
    cell.textLabel.numberOfLines = 4;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
        
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    int rowHeight = 40;
    switch (indexPath.row) {
        case 0:
            rowHeight = 100;
            break;
        case 1:
            rowHeight = 100;
            break;
        default:
            rowHeight = 100;
            break;
    }
    
    return rowHeight;
}


- (IBAction)twitter:(id)sender{
    TWTweetComposeViewController *tweet = [[TWTweetComposeViewController alloc]init];
    [tweet setInitialText:@"#Politics"];
    
    [self presentModalViewController:tweet animated:YES];
}

- (IBAction)reload{
    
    [_tableTitles removeAllObjects];
    [_tableSubTitles removeAllObjects];
    NSData* data = [NSData dataWithContentsOfURL:
                    latestTweetsURL];
    [self fetchedData:data];
    [_tableView reloadData];
    _count=[_tableTitles count];

}




@end
