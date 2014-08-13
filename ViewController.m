//
//  ViewController.m
//  SqliteDemo
//
//  Created by Ashish Pisey on 7/28/14.
//  Copyright (c) 2014 com.AshishPisey. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    NSInteger columnIndex;
}
@end

@implementation ViewController
            
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.dbManager = [[DataBaseManager alloc]initWithDatabaseFileName:@"foodDB.sql"];
    
    [self loadData];
}

-(void)loadData
{
        // Form the query.
        NSString *query = @"select * from foods";
        
        // Get the results.
        if (self.foodArray != nil) {
            self.foodArray = nil;
        }
        self.foodArray = (NSMutableArray *)[[NSArray alloc] initWithArray:[self.dbManager loadDataFromDB:query]];
        
        // Reload the table view.
        [self.foodTableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.foodArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"Cellid";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    
    // foodArray is 2 dimensional array with row number and column number specifing its dimensions
    cell.textLabel.text = [[self.foodArray objectAtIndex:indexPath.row]objectAtIndex:columnIndex];
    
    return cell;
    
}

- (IBAction)segmentAction:(id)sender {
    if ([sender selectedSegmentIndex]==0) {
        // column index = 0
        columnIndex = [self.dbManager.arrColumnNames indexOfObject:@"Veg"];
    }
    else
    {
        // column index = 1
        columnIndex = [self.dbManager.arrColumnNames indexOfObject:@"Non Veg"];
    }
    
    [self.foodTableView reloadData];
}


@end
