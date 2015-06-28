//
//  FurtherDetailsInterfaceController.m
//  WatchExample
//
//  Created by Nicolò Brognoli on 27/06/15.
//  Copyright (c) 2015 Lynx S.p.A. All rights reserved.
//

#import "FurtherDetailsInterfaceController.h"
#import "MMWormhole.h"

#define LONGITUDINE_QUINTINO 10.996453
#define LATITUDINE_QUINTINO 45.44234

@interface FurtherDetailsInterfaceController ()

@property (nonatomic, strong) MMWormhole *wormhole;

@end

@implementation FurtherDetailsInterfaceController

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];
}

- (void)willActivate {
    // This method is called when watch view controller is about to be visible to user
    [super willActivate];
    
    
    
    self.wormhole = [[MMWormhole alloc] initWithApplicationGroupIdentifier:@"group.com.lynxspa.watch.WatchExample"
                                                         optionalDirectory:@"exampleDir"];
    
    MKCoordinateSpan span = MKCoordinateSpanMake(0.01, 0.01);
    CLLocationCoordinate2D center = CLLocationCoordinate2DMake(LATITUDINE_QUINTINO, LONGITUDINE_QUINTINO);
    MKCoordinateRegion region = MKCoordinateRegionMake(center, span);
    [self.map setRegion:region];
    
    [self.wormhole listenForMessageWithIdentifier:@"coordinateCurrentPosition"
                                         listener:^(id messageObject) {
                                             
                                             NSLog(@"Message obj:", messageObject);
                                             
                                             MKCoordinateSpan span = MKCoordinateSpanMake(0.008, 0.008);
                                             CLLocationCoordinate2D center = CLLocationCoordinate2DMake(LATITUDINE_QUINTINO, LONGITUDINE_QUINTINO);
                                             MKCoordinateRegion region = MKCoordinateRegionMake(center, span);
                                             [self.map setRegion:region];
                                             
                                             CLLocationCoordinate2D quintino = CLLocationCoordinate2DMake(LATITUDINE_QUINTINO, LONGITUDINE_QUINTINO);
                                             
//                                             [self.map addAnnotation:quintino withPinColor:WKInterfaceMapPinColorGreen];
                                             [self.map addAnnotation:quintino withImageNamed:@"pin_point" centerOffset:CGPointMake(0, 0)];
                                         }];
    
    // Alternativamente si può recuperare senza listener:
//    id messageObject = [self.wormhole messageWithIdentifier:@"coordinateCurrentPosition"];
}

- (void)didDeactivate {
    // This method is called when watch view controller is no longer visible
    [super didDeactivate];
}

#pragma mark - Actions

- (IBAction)backAction {
    [self popToRootController];
}
                                                        
@end



