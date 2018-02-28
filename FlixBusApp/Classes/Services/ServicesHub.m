//
//  ServicesHub.m
//  FlixBusApp
//
//  Created by Andrey on 2/18/18.
//  Copyright © 2018 Andrey. All rights reserved.
//

#import "ServicesHub.h"

#import "JSONTimetableService.h"

@interface ServicesHub()

@property (strong, nonatomic) NSObject <TimetableService> *timetableService;

@end

@implementation ServicesHub

static ServicesHub *sharedInstance;

+ (void)initialize {
    if (sharedInstance == nil) {
        sharedInstance = [ServicesHub new];
        
        sharedInstance.timetableService = [JSONTimetableService new];
    }
}

+ (ServicesHub *)sharedInstance {
    return sharedInstance;
}

@end
