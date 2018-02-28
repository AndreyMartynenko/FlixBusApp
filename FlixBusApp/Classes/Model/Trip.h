//
//  Trip.h
//  FlixBusApp
//
//  Created by Andrey on 2/19/18.
//  Copyright © 2018 Andrey. All rights reserved.
//

#import "BaseObject.h"
#import "Datetime.h"

@interface Trip : BaseObject

@property (strong, nonatomic) NSString *throughTheStations;
@property (strong, nonatomic) Datetime *datetime;
@property (strong, nonatomic) NSString *lineDirection;
@property (strong, nonatomic) NSArray *route;
@property (strong, nonatomic) NSString *lineCode;
@property (strong, nonatomic) NSString *direction;

@end
