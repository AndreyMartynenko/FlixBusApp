//
//  Trip.m
//  FlixBusApp
//
//  Created by Andrey on 2/19/18.
//  Copyright © 2018 Andrey. All rights reserved.
//

#import "Trip.h"
#import "Route.h"

@implementation Trip

- (void)updateFromDictionary:(NSDictionary *)dictionary {
    [super updateFromDictionary:dictionary];
    
    if (dictionary[@"through_the_stations"]) {
        self.throughTheStations = dictionary[@"through_the_stations"];
    }
    
    if (dictionary[@"datetime"]) {
        self.datetime = [[Datetime alloc] initWithDictionary:dictionary[@"datetime"]];
    }
    
    if (dictionary[@"line_direction"]) {
        self.lineDirection = dictionary[@"line_direction"];
    }
    
    if (dictionary[@"route"]) {
        NSArray *rawRoute = dictionary[@"route"];
        NSMutableArray *route = [NSMutableArray array];
        for (NSDictionary *dictionary in rawRoute)
            [route addObject:[[Route alloc] initWithDictionary:dictionary]];
        
        self.route = [NSArray arrayWithArray:route];
    }
    
    if (dictionary[@"line_code"]) {
        self.lineCode = dictionary[@"line_code"];
    }
    
    if (dictionary[@"direction"]) {
        self.direction = dictionary[@"direction"];
    }
}

@end
