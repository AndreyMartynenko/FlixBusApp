//
//  Coordinates.m
//  FlixBusApp
//
//  Created by Andrey on 2/18/18.
//  Copyright © 2018 Andrey. All rights reserved.
//

#import "Coordinates.h"

@implementation Coordinates

- (void)updateFromDictionary:(NSDictionary *)dictionary {
    [super updateFromDictionary:dictionary];
    
    if (dictionary[@"latitude"]) {
        self.latitude = [dictionary[@"latitude"] doubleValue];
    }
    
    if (dictionary[@"longitude"]) {
        self.longitude = [dictionary[@"longitude"] doubleValue];
    }
}

@end
