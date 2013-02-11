//
//  DataFetcher.m
//  apk
//
//  Created by Simon Olsson on 2013-02-07.
//  Copyright (c) 2013 Kurious Koala. All rights reserved.
//

#import "DataFetcher.h"
#import "DataController.h"
#define NUMBER_OF_RESULTS 100
@interface DataFetcher ()

@property (nonatomic, strong) NSMutableString *currentName;
@property (nonatomic, strong) NSMutableString *currentPrice;
@property (nonatomic, strong) NSMutableString *currentVolume;
@property (nonatomic, strong) NSMutableString *currentAlcohol;
@property (nonatomic, strong) NSMutableString *currentProperty;
@property (nonatomic, strong) NSMutableString *currentType;
@property (nonatomic, strong) NSMutableString *currentArticleID;

@property int number; 


@property BOOL isName;
@property BOOL isAlcohol;
@property BOOL isVolume;
@property BOOL isPrice;
@property BOOL isType;
@property BOOL isArticleID;

@property DataController* dataController;

@end

@implementation DataFetcher

@synthesize xmlParser = _xmlParser;
@synthesize isAlcohol = _isAlcohol;
@synthesize isVolume = _isVolume;
@synthesize isPrice = _isPrice;
@synthesize isName = _isName;
@synthesize isType = _isType;
@synthesize isArticleID = _isArticleID;

@synthesize currentName = _currentName;
@synthesize currentPrice = _currentPrice;
@synthesize currentVolume = _currentVolume;
@synthesize currentAlcohol = _currentAlcohol;
@synthesize currentProperty = _currentProperty;
@synthesize currentType = _currentType;
@synthesize currentArticleID = _currentArticleID;
@synthesize dataController = _dataController;

-(id) init
{
    if(self = [super init]) {
        self.dataController = [[DataController alloc]init];
        self.number = 1;
    }
    return self;
}

-(UIManagedDocument*) database
{
    if(self.dataController == nil) {
        return nil;
    }
    else {
        return self.dataController.database;
    }
    
}
- (void) startFetch
{
    NSString *url = @"http://www.systembolaget.se/Assortment.aspx?Format=Xml";
    
    NSError *error;
    NSString * dataString = [[NSString alloc] initWithContentsOfURL:[[NSURL alloc] initWithString:url] encoding:NSUTF8StringEncoding  error:&error];
    NSData *data = [dataString dataUsingEncoding:NSUTF8StringEncoding];
    
    self.xmlParser = [[NSXMLParser alloc] initWithData:data];
    
    [self.xmlParser setDelegate:self];
    [self.xmlParser parse];
}

- (void) parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict
{
    if ([elementName isEqualToString:@"artikel"])
    {
        //Do something
    } else if([elementName isEqualToString:@"Namn"]) {
        self.currentName = [[NSMutableString alloc] init];
        self.isName = YES;
    } else if([elementName isEqualToString:@"Prisinklmoms"]) {
        self.currentPrice = [[NSMutableString alloc] init];
        self.isPrice = YES;
    } else if([elementName isEqualToString:@"Volymiml"]) {
        self.currentVolume= [[NSMutableString alloc] init];
        self.isVolume = YES;
    } else if([elementName isEqualToString:@"Alkoholhalt"]) {
        self.currentAlcohol = [[NSMutableString alloc] init];
        self.isAlcohol = YES;
    } else if([elementName isEqualToString:@"Varugrupp"]) {
        self.currentType = [[NSMutableString alloc] init];
        self.isType = YES;
    } else if ([elementName isEqualToString:@"Artikelid"]) {
        self.currentArticleID = [[NSMutableString alloc] init];
        self.isArticleID = YES;
    } else {
        // Do something
    }
}

- (void) parser:(NSXMLParser *) parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
    if([elementName isEqualToString:@"artikel"]) {
        //        NSLog(@"Namn: %@", self.currentName);
        //        NSLog(@"Type: %@", self.currentType);
        //        NSLog(@"Price: %@", self.currentPrice);
        //        NSLog(@"Volume: %@", self.currentVolume);
        //        NSLog(@"Alcohol: %@", self.currentAlcohol);
        //        NSLog(@"     ");
        
        // Insert the item into the core data
        //        DataController *dataController = [[DataController alloc] init];
        //        [dataController insertItemIntoCoreData:self.currentName price:self.currentPrice volume:self.currentVolume alcohol:self.currentAlcohol type:self.currentType];
        
        // The item is done
        // NSLog(@"Item complete: %@", self.currentName);
        
        [self.dataController fetchItemWithAritcleID:[self.currentArticleID doubleValue] name:self.currentName alcohol:[self.currentAlcohol doubleValue] price:[self.currentPrice doubleValue] volume:[self.currentVolume doubleValue] type:self.currentType];
        //self.number ++;
     /*   if(self.number >= NUMBER_OF_RESULTS) {
            [self.xmlParser abortParsing];
        }
        */
        self.currentAlcohol = nil;
        self.currentName = nil;
        self.currentPrice = nil;
        self.currentType = nil;
        self.currentVolume = nil;
        self.currentArticleID = nil;
        
    }
    
    if([elementName isEqualToString:@"Namn"]) {
        self.isName = NO;
    } else if([elementName isEqualToString:@"Prisinklmoms"]) {
        self.isPrice = NO;
    } else if([elementName isEqualToString:@"Volymiml"]) {
        self.isVolume = NO;
    } else if([elementName isEqualToString:@"Alkoholhalt"]) {
        self.isAlcohol = NO;
    } else if([elementName isEqualToString:@"Varugrupp"]) {
        self.isType = NO;
    } else if([elementName isEqualToString:@"Artikelid"]) {
        self.isArticleID = NO;
    } else  if ([elementName isEqualToString:@"artiklar"]){
        NSLog(@"Did end parsing");
    }
}

- (void) parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
    if (self.isAlcohol) {
        [self.currentAlcohol appendString:string];
    } else if (self.isName) {
        [self.currentName appendString:string];
    } else if (self.isPrice) {
        [self.currentPrice appendString:string];
    } else if (self.isVolume) {
        [self.currentVolume appendString:string];
    } else if (self.isType) {
        [self.currentType appendString:string];
    } else if (self.isArticleID) {
        [self.currentArticleID appendString:string];
    } else {
        //Do nothing
    }
}
-(void) parserDidEndDocument:(NSXMLParser *)parser
{
    NSLog(@"Slutade parsa");
}

@end
