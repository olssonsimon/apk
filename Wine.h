//
//  Wine.h
//  apk
//
//  Created by Simon Olsson on 2013-02-15.
//  Copyright (c) 2013 Kurious Koala. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Item;

@interface Wine : NSManagedObject

@property (nonatomic, retain) NSString * type;
@property (nonatomic, retain) Item *wineRelationship;

@end
