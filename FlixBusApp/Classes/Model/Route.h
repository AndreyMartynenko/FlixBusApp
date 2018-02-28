//
//  Route.h
//  FlixBusApp
//
//  Created by Andrey on 2/18/18.
//  Copyright © 2018 Andrey. All rights reserved.
//

#import "BaseObject.h"
#import "Coordinates.h"

@interface Route : BaseObject

@property (strong, nonatomic) NSString *iD;
@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *address;
@property (strong, nonatomic) NSString *fullAddress;
@property (strong, nonatomic) Coordinates *coordinates;

@end
