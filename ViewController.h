//
//  ViewController.h
//  SqliteDemo
//
//  Created by Ashish Pisey on 7/28/14.
//  Copyright (c) 2014 com.AshishPisey. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DataBaseManager.h"
@interface ViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *foodTableView;
@property (nonatomic,retain) DataBaseManager *dbManager;
@property (nonatomic,retain) NSMutableArray *foodArray;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentedCntrl;

- (IBAction)segmentAction:(id)sender;

-(void)loadData;
@end

