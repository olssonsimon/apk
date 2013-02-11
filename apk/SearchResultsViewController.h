//
//  SearchResultsViewController.h
//  apk
//
//  Created by Simon Olsson on 2013-02-09.
//  Copyright (c) 2013 Kurious Koala. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface SearchResultsViewController : UITableViewController<NSFetchedResultsControllerDelegate>

@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;
@property (nonatomic, strong) UIManagedDocument *apkdatabase;

@end
