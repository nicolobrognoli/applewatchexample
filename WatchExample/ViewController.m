//
//  ViewController.m
//  WatchExample
//
//  Created by Nicolò Brognoli on 27/06/15.
//  Copyright (c) 2015 Lynx S.p.A. All rights reserved.
//

#import "ViewController.h"
#import "MMWormhole.h"

@interface ViewController ()

@property (nonatomic, strong) CLLocationManager *locationMgr;
@property (nonatomic, strong) CLLocation *lastLocation;
@property (nonatomic, strong) MMWormhole *wormhole;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.wormhole = [[MMWormhole alloc] initWithApplicationGroupIdentifier:@"group.com.lynxspa.watch.WatchExample"
                                                         optionalDirectory:@"exampleDir"];
    
    self.locationMgr = [[CLLocationManager alloc] init];
    self.locationMgr.desiredAccuracy = kCLLocationAccuracyBest;
    self.locationMgr.delegate = self;
    
    [self.locationMgr startUpdatingLocation];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Actions

- (IBAction)updateAction:(id)sender {
    [self.wormhole passMessageObject:@{@"titleString" : @"Pingu"}
                          identifier:@"coordinateCurrentPosition"];
}

#pragma mark - CLLocationManagerDelegate

-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    CLLocation *currentLocation;
    if (locations && [locations objectAtIndex:0]) {
        currentLocation = [locations objectAtIndex:0];
    }
    
    if (currentLocation) {
        if (!self.lastLocation) {
            self.lastLocation = currentLocation;
        }
        
        if (currentLocation.coordinate.latitude != self.lastLocation.coordinate.latitude &&
            currentLocation.coordinate.longitude != self.lastLocation.coordinate.longitude) {
            self.lastLocation = currentLocation;
            NSLog(@"New location: %f, %f",
                  self.lastLocation.coordinate.latitude,
                  self.lastLocation.coordinate.longitude);
            [self.locationMgr stopUpdatingLocation];
        }
    }
    
    MKCoordinateSpan span = MKCoordinateSpanMake(0.6, 0.6);
    CLLocationCoordinate2D center = CLLocationCoordinate2DMake(self.lastLocation.coordinate.latitude, self.lastLocation.coordinate.longitude);
    MKCoordinateRegion region = MKCoordinateRegionMake(center, span);
}

@end
