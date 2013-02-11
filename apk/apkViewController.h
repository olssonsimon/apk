//
//  apkViewController.h
//  apk
//
//  Created by Simon Olsson on 2013-02-06.
//  Copyright (c) 2013 Kurious Koala. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DataFetcher.h"
@interface apkViewController : UIViewController
@property(nonatomic, strong) DataFetcher* fetcher;
@end
