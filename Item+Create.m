//
//  Item+Create.m
//  apk
//
//  Created by Simon Olsson on 2013-02-09.
//  Copyright (c) 2013 Kurious Koala. All rights reserved.
//

#import "Item+Create.h"

@implementation Item (Create)

+ (Item *) initItemWithName:(NSString *)name price:(double)price volume:(double)volume alcohol:(double)alcohol type:(NSString *)type artikelID:(double)artikelID inManagedObjectContext:(NSManagedObjectContext *)context
{
//    Item *item = nil;
//    
//    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Item"];
//    request.predicate = [NSPredicate predicateWithFormat:@"artikelID = %@", artikelID];
//    NSSortDescriptor *sortDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"artikelID" ascending:YES];
//    request.sortDescriptors = [NSArray arrayWithObject:sortDescriptor];
//    
//    NSError *error = nil;
//    NSArray *items = [context executeFetchRequest:request error:&error];
//    
//    if (!items || ([items count] > 1)) {
//        // handle error
//    } else if (![items count]) {
//        item = [NSEntityDescription insertNewObjectForEntityForName:@"Item"
//                                                     inManagedObjectContext:context];
//
//        item.artikelID = [NSNumber numberWithDouble:artikelID];
//    } else {
//        item = [items lastObject];
//    }
    
    Item *item = [NSEntityDescription insertNewObjectForEntityForName:@"Item" inManagedObjectContext:context];
    item.artikelID = [NSNumber numberWithDouble:artikelID];
    
    return item;
}

@end
