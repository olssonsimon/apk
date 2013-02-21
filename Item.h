//
//  Item.h
//  apk
//
//  Created by Simon Olsson on 2013-02-15.
//  Copyright (c) 2013 Kurious Koala. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Other, Spirits, Wine;

@interface Item : NSManagedObject

@property (nonatomic, retain) NSNumber * alcohol;
@property (nonatomic, retain) NSNumber * artikelID;
@property (nonatomic, retain) NSNumber * price;
@property (nonatomic, retain) NSNumber * volume;
@property (nonatomic, retain) NSSet *beerisA;
@property (nonatomic, retain) NSSet *wineIsA;
@property (nonatomic, retain) NSSet *spiritisA;
@property (nonatomic, retain) NSSet *otherisA;
@end

@interface Item (CoreDataGeneratedAccessors)

- (void)addBeerisAObject:(NSManagedObject *)value;
- (void)removeBeerisAObject:(NSManagedObject *)value;
- (void)addBeerisA:(NSSet *)values;
- (void)removeBeerisA:(NSSet *)values;

- (void)addWineIsAObject:(Wine *)value;
- (void)removeWineIsAObject:(Wine *)value;
- (void)addWineIsA:(NSSet *)values;
- (void)removeWineIsA:(NSSet *)values;

- (void)addSpiritisAObject:(Spirits *)value;
- (void)removeSpiritisAObject:(Spirits *)value;
- (void)addSpiritisA:(NSSet *)values;
- (void)removeSpiritisA:(NSSet *)values;

- (void)addOtherisAObject:(Other *)value;
- (void)removeOtherisAObject:(Other *)value;
- (void)addOtherisA:(NSSet *)values;
- (void)removeOtherisA:(NSSet *)values;

@end
