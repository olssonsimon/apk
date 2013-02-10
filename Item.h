//
//  Item.h
//  apk
//
//  Created by Simon Olsson on 2013-02-09.
//  Copyright (c) 2013 Kurious Koala. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Item : NSManagedObject

@property (nonatomic, retain) NSNumber * alcohol;
@property (nonatomic, retain) NSNumber * price;
@property (nonatomic, retain) NSString * type;
@property (nonatomic, retain) NSNumber * volume;
@property (nonatomic, retain) NSNumber * artikelID;

@end
