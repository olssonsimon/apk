//
//  DataController.h
//  apk
//
//  Created by Simon Olsson on 2013-02-09.
//  Copyright (c) 2013 Kurious Koala. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Item.h"
#import "SearchResultsViewController.h"

@interface DataController : NSObject

@property (nonatomic, strong) UIManagedDocument *database;

- (void)fetchItemWithAritcleID:(double)articleID name:(NSString *)name alcohol:(double)alcohol price:(double)price volume:(double)volume type:(NSString *)type;

@end
