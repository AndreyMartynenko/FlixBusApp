//
//  Timetable.h
//  FlixBusApp
//
//  Created by Andrey on 2/18/18.
//  Copyright © 2018 Andrey. All rights reserved.
//

#import "BaseObject.h"

@interface Timetable : BaseObject

@property (strong, nonatomic) NSArray *arrivals;
@property (strong, nonatomic) NSArray *departures;
@property (strong, nonatomic) NSString *message;

@end
