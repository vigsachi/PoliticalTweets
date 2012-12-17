//
//  DetailViewController.m
//  #Politics
//
//  Created by Vig Sachidananda on 9/28/12.
//  Copyright (c) 2012 Vig Sachidananda. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController
@synthesize detailTable=_detailTable;
@synthesize tweeterImage=_tweeterImage;
@synthesize tweetInfo=_tweetInfo;


#pragma mark - Required UITableView Methods


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath

{
    UITableViewCell *cell = nil;
    cell = [_detailTable dequeueReusableCellWithIdentifier:@"detailCell"];
    
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier: @"detailCell"];
    }
    
    cell.textLabel.text = [_tweetInfo objectAtIndex:indexPath.row];
    
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


- (void)viewDidLoad
{
    NSString* tweetText = @"TweetName";
    NSString* tweetText2 = @"Hi";
    [_tweetInfo addObject:tweetText];
    [_tweetInfo addObject:tweetText2];
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
