//
//  Arrival.m
//  FlixBusApp
//
//  Created by Andrey on 2/18/18.
//  Copyright © 2018 Andrey. All rights reserved.
//

#import "Arrival.h"

@implementation Arrival

- (void)updateFromDictionary:(NSDictionary *)dictionary {
    [super updateFromDictionary:dictionary];
    
    if (dictionary[@"delay_status"]) {
        self.delayStatus = dictionary[@"delay_status"];
    }
    
    if (dictionary[@"delay"]) {
        self.delay = [[Datetime alloc] initWithDictionary:dictionary[@"delay"]];
    }
    
    if (dictionary[@"station_ride_message"]) {
        self.delayStatus = dictionary[@"station_ride_message"];
    }
}

@end
