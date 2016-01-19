//
//  ViewController.m
//  test_handlebars_post_install_hook
//
//  Created by Jim Kremens on 1/18/16.
//  Copyright © 2016 Jim Kremens. All rights reserved.
//

#import <HBHandlebars/HBHandlebars.h>
#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];

	NSString * str = [HBHandlebars renderTemplateString:@"" withContext:@"" error:nil];
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];

	// Dispose of any resources that can be recreated.
}

@end
