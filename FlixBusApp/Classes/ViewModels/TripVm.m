//
//  TripVm.m
//  FlixBusApp
//
//  Created by Andrey on 2/20/18.
//  Copyright © 2018 Andrey. All rights reserved.
//

#import "TripVm.h"
#import "ServicesHub.h"
#import "Timetable.h"
#import "Route.h"

@interface TripVm ()

@property (weak) id<TripVmDelegate> delegate;

@property (strong, nonatomic) Timetable *items;
@property (strong, nonatomic) NSDictionary *groupedItems;
@property (strong, nonatomic) NSArray *sortedKeys;
@property (assign, nonatomic) BOOL isArrivals;

@end

@implementation TripVm

- (instancetype)initWithDelegate:(id<TripVmDelegate>)delegate {
    if (self = [super init]) {
        self.delegate = delegate;
        self.isArrivals = YES;
        [self retrieveData];
    }
    
    return self;
}

- (void)stop {
    self.items = nil;
    self.groupedItems = nil;
    self.sortedKeys = nil;
    self.delegate = nil;
}

- (void)refresh {
    [self retrieveData];
}

- (NSUInteger)sectionCount {
    return self.groupedItems.count;
}

- (NSString *)sectionTitleAt:(NSUInteger)section {
    return self.sortedKeys[section];
}

- (NSUInteger)itemCountAtSection:(NSUInteger)section {
    return [self.groupedItems[self.sortedKeys[section]] count];
}

- (Trip *)itemAtSection:(NSUInteger)section row:(NSUInteger)row {
    return self.groupedItems[self.sortedKeys[section]][row];
}

- (void)itemPressedAtSection:(NSUInteger)section row:(NSUInteger)row {
    Trip *trip = [self itemAtSection:section row:row];
    NSMutableString *details = [NSMutableString string];
    
    for (Route *route in trip.route) {
        [details appendString:route.name];
        [details appendString:@": "];
        [details appendString:route.fullAddress];
        [details appendString:@" ("];
        [details appendString:[[NSNumber numberWithDouble:route.coordinates.latitude] stringValue]];
        [details appendString:@", "];
        [details appendString:[[NSNumber numberWithDouble:route.coordinates.longitude] stringValue]];
        [details appendString:@")\n\n"];
    }
    
    [details deleteCharactersInRange:NSMakeRange(details.length - 2, 2)];
    
    [self.delegate presentRouteInformationWithTitle:@"Route" message:details];
}

- (void)toggleDestination {
    self.isArrivals = !self.isArrivals;
    
    [self updateDestination];
    [self.delegate onTripsUpdated];
}

- (void)updateDestination {
    if (self.isArrivals) {
        self.groupedItems = [self groupByDate:self.items.arrivals];
        [self.delegate setTripDestinationToArrivals];
    } else {
        self.groupedItems = [self groupByDate:self.items.departures];
        [self.delegate setTripDestinationToDepartures];
    }
}

#pragma mark - Private methods

- (void)retrieveData {
    [[ServicesHub sharedInstance].timetableService retrieveTimetableDataSuccess:^(id object) {
        NSLog(@"__timetableService: success");
        
        self.items = (Timetable *)object;
        [self updateDestination];
        self.sortedKeys = [self.groupedItems.allKeys sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
        
        [self.delegate onTripsUpdated];
        
    } failure:^(NSError *error) {
        NSLog(@"__timetableService: failure");
        
        [self.delegate onError:error];
    }];
}

- (NSDictionary *)groupByDate:(NSArray *)trips {
    NSMutableDictionary *group  = [NSMutableDictionary dictionary];
    for (NSObject *trip in trips) {
        NSString *newKey = ((Trip *)trip).datetime.dateString;
        NSMutableArray *newValue = group[newKey];
        if (!newValue) {
            newValue = [NSMutableArray array];
            group[newKey] = newValue;
        }
        [newValue addObject:trip];
    }
    
    return group;
}

@end
