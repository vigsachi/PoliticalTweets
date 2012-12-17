//
//  DetailViewController.h
//  #Politics
//
//  Created by Vig Sachidananda on 9/28/12.
//  Copyright (c) 2012 Vig Sachidananda. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (nonatomic, strong) IBOutlet UIImageView *tweeterImage;
@property (weak, nonatomic) IBOutlet UITableView *detailTable;
@property (nonatomic, strong) NSMutableArray *tweetInfo;


@end
