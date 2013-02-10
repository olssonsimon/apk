//
//  DataController.m
//  apk
//
//  Created by Simon Olsson on 2013-02-09.
//  Copyright (c) 2013 Kurious Koala. All rights reserved.
//

#import "DataController.h"
#import "Item+Create.h"

@interface DataController ()

@end

@implementation DataController

-(id) init
{
    if(self = [super init]) {
        if (!self.database) {  // for demo purposes, we'll create a default database if none is set
            NSURL *url = [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
            url = [url URLByAppendingPathComponent:@"Default Database"];
            // url is now "<Documents Directory>/Default Photo Database"
            self.database = [[UIManagedDocument alloc] initWithFileURL:url]; // setter will create this for us on disk
        }
        
    }
    return self;
}

-(void) setDatabase:(UIManagedDocument *)database
{
    if (_database != database) {
        _database = database;
        [self openDocument];
    }
}



- (void)openDocument
{
    if (![[NSFileManager defaultManager] fileExistsAtPath:[self.database.fileURL path]]) {
        // does not exist on disk, so create it
        [self.database saveToURL:self.database.fileURL forSaveOperation:UIDocumentSaveForCreating completionHandler:^(BOOL success) {
//            [self setupFetchedResultsController];
            //[self fetchFlickrDataIntoDocument:self.database];
            
        }];
    } else if (self.database.documentState == UIDocumentStateClosed) {
        // exists on disk, but we need to open it
        [self.database openWithCompletionHandler:^(BOOL success) {
//            [self setupFetchedResultsController];
        }];
    } else if (self.database.documentState == UIDocumentStateNormal) {
        // already open and ready to use
//        [self setupFetchedResultsController];
    }
}



- (void)fetchItemWithAritcleID:(double)articleID name:(NSString *)name alcohol:(double)alcohol price:(double)price volume:(double)volume type:(NSString *)type
{
    // NSLog(@"Fetching item: %@", name);
    
    // Added a queue so items only are added once
    dispatch_queue_t fetchQ = dispatch_queue_create("Systembolaget fetcher", NULL);
    dispatch_async(fetchQ, ^{
        [self.database.managedObjectContext performBlock:^{
            [Item initItemWithName:name price:price volume:volume alcohol:alcohol type:type artikelID:articleID inManagedObjectContext:self.database.managedObjectContext];
            NSLog(@"%f", articleID);
            [self.database saveToURL:self.database.fileURL forSaveOperation:UIDocumentSaveForOverwriting completionHandler:NULL];
        }];
    });
}

//    dispatch_queue_t fetchQ = dispatch_queue_create("Systembolaget fetcher", NULL);
//    dispatch_async(fetchQ, ^{
////        NSArray *items = [FlickrFetcher recentGeoreferencedPhotos];
//        [document.managedObjectContext performBlock:^{ // perform in the NSMOC's safe thread (main thread)
//            for (NSDictionary *flickrInfo in photos) {
//                [Photo photoWithFlickrInfo:flickrInfo inManagedObjectContext:document.managedObjectContext];
//                // table will automatically update due to NSFetchedResultsController's observing of the NSMOC
//            }
//            // should probably saveToURL:forSaveOperation:(UIDocumentSaveForOverwriting)completionHandler: here!
//            // we could decide to rely on UIManagedDocument's autosaving, but explicit saving would be better
//            // because if we quit the app before autosave happens, then it'll come up blank next time we run
//            // this is what it would look like (ADDED AFTER LECTURE) ...
//            [document saveToURL:document.fileURL forSaveOperation:UIDocumentSaveForOverwriting completionHandler:NULL];
//            // note that we don't do anything in the completion handler this time
//        }];
//    });
//    dispatch_release(fetchQ);


@end
