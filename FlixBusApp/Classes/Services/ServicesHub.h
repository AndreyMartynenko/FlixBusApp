//
//  ServicesHub.h
//  FlixBusApp
//
//  Created by Andrey on 2/18/18.
//  Copyright © 2018 Andrey. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TimetableService.h"

@interface ServicesHub : NSObject

+ (ServicesHub *)sharedInstance;

- (NSObject <TimetableService> *)timetableService;

@end
