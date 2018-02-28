//
//  Arrival.h
//  FlixBusApp
//
//  Created by Andrey on 2/18/18.
//  Copyright © 2018 Andrey. All rights reserved.
//

#import "BaseObject.h"
#import "Trip.h"

@interface Arrival : Trip

@property (strong, nonatomic) NSString *delayStatus;
@property (strong, nonatomic) Datetime *delay;
@property (strong, nonatomic) NSString *stationRideMessage;

@end
