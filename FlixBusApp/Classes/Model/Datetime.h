//
//  Datetime.h
//  FlixBusApp
//
//  Created by Andrey on 2/18/18.
//  Copyright © 2018 Andrey. All rights reserved.
//

#import "BaseObject.h"

@interface Datetime : BaseObject

@property (strong, nonatomic) NSString *timestamp;
@property (strong, nonatomic) NSString *tz;

@property (readonly) NSString *dateString;
@property (readonly) NSString *timeString;

@end
