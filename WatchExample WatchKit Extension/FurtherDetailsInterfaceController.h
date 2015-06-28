//
//  FurtherDetailsInterfaceController.h
//  WatchExample
//
//  Created by Nicolò Brognoli on 27/06/15.
//  Copyright (c) 2015 Lynx S.p.A. All rights reserved.
//

#import <WatchKit/WatchKit.h>
#import <Foundation/Foundation.h>

@interface FurtherDetailsInterfaceController : WKInterfaceController

@property (weak, nonatomic) IBOutlet WKInterfaceMap *map;
@property (weak, nonatomic) IBOutlet WKInterfaceButton *btnBack;

@end
