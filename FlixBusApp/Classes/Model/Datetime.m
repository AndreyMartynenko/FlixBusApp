//
//  Datetime.m
//  FlixBusApp
//
//  Created by Andrey on 2/18/18.
//  Copyright © 2018 Andrey. All rights reserved.
//

#import "Datetime.h"

@implementation Datetime

- (void)updateFromDictionary:(NSDictionary *)dictionary {
    [super updateFromDictionary:dictionary];
    
    if (dictionary[@"timestamp"]) {
        self.timestamp = dictionary[@"timestamp"];
    }
    
    if (dictionary[@"tz"]) {
        self.tz = dictionary[@"tz"];
    }
}

- (NSString *)dateString {
    NSDate *date = [NSDate dateWithTimeIntervalSince1970: [self.timestamp doubleValue]];
    
    return [[self formatterWithFormat:@"dd/MM/yyyy" timeZone:self.tz] stringFromDate:date];
}

- (NSString *)timeString {
    NSDate *date = [NSDate dateWithTimeIntervalSince1970: [self.timestamp doubleValue]];
    
    return [[self formatterWithFormat:@"HH:mm" timeZone:self.tz] stringFromDate:date];
}

- (NSDateFormatter *)formatterWithFormat:(NSString *)format timeZone:(NSString *)timeZone {
    NSDateFormatter *formatter = [NSDateFormatter new];
    [formatter setDateFormat:format];
    [formatter setTimeZone:[NSTimeZone timeZoneWithName:timeZone]];
    
    return formatter;
}

@end
