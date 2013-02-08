//
//  apkViewController.m
//  apk
//
//  Created by Simon Olsson on 2013-02-06.
//  Copyright (c) 2013 Kurious Koala. All rights reserved.
//

#import "apkViewController.h"
#import "DataFetcher.h"

@interface apkViewController ()

@end

@implementation apkViewController

- (IBAction)searchButton:(id)sender {
    DataFetcher* dataFetcher = [[DataFetcher alloc]init];
    [dataFetcher startFetch];    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.navigationController.navigationBar.barStyle = UIBarStyleBlackOpaque;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
