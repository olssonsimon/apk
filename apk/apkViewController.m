//
//  apkViewController.m
//  apk
//
//  Created by Simon Olsson on 2013-02-06.
//  Copyright (c) 2013 Kurious Koala. All rights reserved.
//

#import "apkViewController.h"
#import "SearchResultsViewController.h"


@interface apkViewController ()

@end

@implementation apkViewController

- (IBAction)searchButton:(id)sender {
    // Search the database for matching items
    
}

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqualToString:@"Apk to Results"]) {
        //KANSKE BLIR FEL SET METOD?!..
//        [segue.destinationViewController setApkdatabase:self.fetcher.database];
        if(self.fetcher.database == nil) {
            NSLog(@"Är NIL");
        }
        [segue.destinationViewController setApkdatabase:self.fetcher.database];
    }
}

- (IBAction)updateDatabaseButton:(id)sender {
   self.fetcher = [[DataFetcher alloc]init];
    [self.fetcher startFetch];
    
    NSLog(@"Updating complete!");
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.navigationController.navigationBar.barStyle = UIBarStyleBlackOpaque;
}

@end
