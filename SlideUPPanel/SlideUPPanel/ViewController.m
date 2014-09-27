//
//  ViewController.m
//  SlideUPPanel
//
//  Created by Mikheil Pailodze on 9/27/14.
//  Copyright (c) 2014 Mikheil Pailodze. All rights reserved.
//

#import "ViewController.h"
#import "SUPanel.h" // importing header file of our class

@interface ViewController () {
    
    SUPanel *panel; // declaring the object of our class SUPanel
    
}

@end

@implementation ViewController


- (IBAction)buttonClicked:(id)sender {
    
    [panel slideUp];
}


- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    panel = [[SUPanel alloc] initWithHeight:300]; // initializing the panel
    
    
    [self.view insertSubview:panel aboveSubview:[self.view.subviews lastObject]]; // adding the panel to view.
   
    UILabel *theLabel = [[UILabel alloc] initWithFrame:CGRectMake(50, 50, 100, 20)];
    theLabel.text = @"Hello World!";
    theLabel.textColor = [UIColor blackColor];
    
    [panel addSubview:theLabel];
    
  
    

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

@end
