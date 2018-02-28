//
//  TripVmDelegate.h
//  FlixBusApp
//
//  Created by Andrey on 2/20/18.
//  Copyright © 2018 Andrey. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol TripVmDelegate <NSObject>

- (void)onTripsUpdated;
- (void)onError:(nullable NSError *)error;
- (void)setTripDestinationToArrivals;
- (void)setTripDestinationToDepartures;
- (void)presentRouteInformationWithTitle:(nullable NSString *)title message:(nullable NSString *)message;

@end
