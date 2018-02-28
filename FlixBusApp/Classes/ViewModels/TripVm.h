//
//  TripVm.h
//  FlixBusApp
//
//  Created by Andrey on 2/20/18.
//  Copyright © 2018 Andrey. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Trip.h"
#import "TripVmDelegate.h"

@interface TripVm : NSObject

- (instancetype)initWithDelegate:(id<TripVmDelegate>)delegate;
- (void)stop;
- (void)refresh;

- (NSUInteger)sectionCount;
- (NSString *)sectionTitleAt:(NSUInteger)section;
- (NSUInteger)itemCountAtSection:(NSUInteger)section;
- (Trip *)itemAtSection:(NSUInteger)section row:(NSUInteger)row;
- (void)itemPressedAtSection:(NSUInteger)section row:(NSUInteger)row;

- (void)toggleDestination;

@end
