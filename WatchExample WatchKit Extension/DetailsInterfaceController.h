//
//  DetailsInterfaceController.h
//  WatchExample
//
//  Created by Nicolò Brognoli on 27/06/15.
//  Copyright (c) 2015 Lynx S.p.A. All rights reserved.
//

#import <WatchKit/WatchKit.h>
#import <Foundation/Foundation.h>

@interface DetailsInterfaceController : WKInterfaceController

@property (weak, nonatomic) IBOutlet WKInterfaceButton *btnMap;
@property (weak, nonatomic) IBOutlet WKInterfaceLabel *lblText;

@end
