//
//  DataBaseManager.h
//  SqliteDemo
//
//  Created by Ashish Pisey on 7/28/14.
//  Copyright (c) 2014 com.AshishPisey. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>
@interface DataBaseManager : NSObject
@property(nonatomic,retain)NSString *databaseFileName;
@property(nonatomic,retain)NSString *documentsPath;

@property (nonatomic, strong) NSMutableArray *arrColumnNames;

@property (nonatomic) int affectedRows;

@property (nonatomic) long long lastInsertedRowID;
-(instancetype)initWithDatabaseFileName:(NSString *)dbFileName;

-(NSArray *)loadDataFromDB:(NSString *)query;

-(void)executeQuery:(NSString *)query;
@end
