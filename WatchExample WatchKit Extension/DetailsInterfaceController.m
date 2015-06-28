//
//  DetailsInterfaceController.m
//  WatchExample
//
//  Created by Nicolò Brognoli on 27/06/15.
//  Copyright (c) 2015 Lynx S.p.A. All rights reserved.
//

#import "DetailsInterfaceController.h"

@interface DetailsInterfaceController ()

@property (nonatomic, strong) NSDictionary *contextDictionary;

@end

@implementation DetailsInterfaceController

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];
    
    self.contextDictionary = context;
}

- (void)willActivate {
    [super willActivate];
    
    [self.lblText setText:[self.contextDictionary objectForKey:@"labelText"]];
}

- (void)didDeactivate {
    // This method is called when watch view controller is no longer visible
    [super didDeactivate];
}

- (IBAction)mapButton {
    [self pushControllerWithName:@"furtherDetails" context:nil];
}

@end



