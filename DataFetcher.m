//
//  DataFetcher.m
//  apk
//
//  Created by Simon Olsson on 2013-02-07.
//  Copyright (c) 2013 Kurious Koala. All rights reserved.
//

#import "DataFetcher.h"

@implementation DataFetcher

@synthesize xmlParser = _xmlParser;

- (void) startFetch
{    
    NSString *url = @"http://www.systembolaget.se/Assortment.aspx?Format=Xml";
    self.xmlParser = [[NSXMLParser alloc] initWithContentsOfURL:[[NSURL alloc] initWithString:url]];

    
    [self.xmlParser setDelegate:self];
    
    [self.xmlParser parse];
}

- (void) parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict
{
    
    NSLog(@"%@", elementName);
        
   /*
    NSArray* keys = attributeDict.allKeys;
    NSLog(@"Antal keys: %d",[keys count]);
    for(int i=0; i<[keys count]; i++){
        NSLog(@"%@", [keys objectAtIndex:i]);
    };
    NSString *name = [attributeDict objectForKey:@"Namn"];
*/
}

- (void) parser:(NSXMLParser *) parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
    
}

- (void) parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
    
}

-(void) fetch
{
    [self.xmlParser parse];
}

@end
