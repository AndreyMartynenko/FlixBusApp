//
//  Timetable.m
//  FlixBusApp
//
//  Created by Andrey on 2/18/18.
//  Copyright © 2018 Andrey. All rights reserved.
//

#import "Timetable.h"
#import "Arrival.h"
#import "Departure.h"

@implementation Timetable

- (void)updateFromDictionary:(NSDictionary *)dictionary {
    NSDictionary *timetableData = dictionary[@"timetable"];
    
    [super updateFromDictionary:timetableData];
    
    if (timetableData[@"arrivals"]) {
        NSArray *rawArrivals = timetableData[@"arrivals"];
        NSMutableArray *arrivals = [NSMutableArray array];
        for (NSDictionary *dictionary in rawArrivals)
            [arrivals addObject:[[Arrival alloc] initWithDictionary:dictionary]];
        
        self.arrivals = [NSArray arrayWithArray:arrivals];
    }
    
    if (timetableData[@"departures"]) {
        NSArray *rawDepartures = timetableData[@"departures"];
        NSMutableArray *departures = [NSMutableArray array];
        for (NSDictionary *dictionary in rawDepartures)
            [departures addObject:[[Departure alloc] initWithDictionary:dictionary]];
        
        self.departures = [NSArray arrayWithArray:departures];
    }
    
    if (timetableData[@"message"]) {
        self.message = timetableData[@"message"];
    }
}

@end
