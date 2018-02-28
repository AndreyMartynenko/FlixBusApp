//
//  JSONTimetableService.m
//  FlixBusApp
//
//  Created by Andrey on 2/19/18.
//  Copyright © 2018 Andrey. All rights reserved.
//

#import "JSONTimetableService.h"
#import "Timetable.h"

static NSString * const path = @"mobile/v1/network/station/1/timetable";

@implementation JSONTimetableService

- (void)retrieveTimetableDataSuccess:(SuccessObjectBlock)successBlock failure:(FailureBlock)failureBlock {
    [self request:path parameters:nil success:^(id responseObject) {
        Timetable *response = [[Timetable alloc] initWithDictionary:responseObject];
        successBlock(response);
        
    } failure:^(NSError *error) {
        failureBlock(error);
    }];
}

@end
