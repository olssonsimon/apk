//
//  Item+Create.h
//  apk
//
//  Created by Simon Olsson on 2013-02-09.
//  Copyright (c) 2013 Kurious Koala. All rights reserved.
//

#import "Item.h"

@interface Item (Create)

+ (Item *) initItemWithName:(NSString *)name price:(double)price volume:(double)volume alcohol:(double)alcohol type:(NSString *)type artikelID:(double)artikelID inManagedObjectContext:(NSManagedObjectContext *)context;

@end
