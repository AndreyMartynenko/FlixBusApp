//
//  Route.m
//  FlixBusApp
//
//  Created by Andrey on 2/18/18.
//  Copyright © 2018 Andrey. All rights reserved.
//

#import "Route.h"

@implementation Route

- (void)updateFromDictionary:(NSDictionary *)dictionary {
    [super updateFromDictionary:dictionary];
    
    if (dictionary[@"id"]) {
        self.iD = dictionary[@"id"];
    }
    
    if (dictionary[@"name"]) {
        self.name = dictionary[@"name"];
    }
    
    if (dictionary[@"address"]) {
        self.address = dictionary[@"address"];
    }
    
    if (dictionary[@"full_address"]) {
        self.fullAddress = dictionary[@"full_address"];
    }
    
    if (dictionary[@"coordinates"]) {
        self.coordinates = [[Coordinates alloc] initWithDictionary:dictionary[@"coordinates"]];
    }
}

@end
