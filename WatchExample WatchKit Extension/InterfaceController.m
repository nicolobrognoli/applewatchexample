//
//  InterfaceController.m
//  WatchExample WatchKit Extension
//
//  Created by Nicolò Brognoli on 27/06/15.
//  Copyright (c) 2015 Lynx S.p.A. All rights reserved.
//

#import "InterfaceController.h"


@interface InterfaceController()

@end


@implementation InterfaceController

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];

    // Configure interface objects here.
}

- (void)willActivate {
    // This method is called when watch view controller is about to be visible to user
    [super willActivate];
}

- (void)didDeactivate {
    // This method is called when watch view controller is no longer visible
    [super didDeactivate];
}

#pragma mark - Actions

- (IBAction)detailsButtonAction {
    NSDictionary *contextDictionary = @{@"labelText" : @"Testo inviato dal precedente controller"};
    [self pushControllerWithName:@"detail" context:contextDictionary];
}

@end



