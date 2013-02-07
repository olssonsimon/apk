//
//  DataFetcher.h
//  apk
//
//  Created by Simon Olsson on 2013-02-07.
//  Copyright (c) 2013 Kurious Koala. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataFetcher : NSObject <NSXMLParserDelegate>

@property (nonatomic, strong) NSXMLParser *xmlParser;
-(void) startFetch;

@end
