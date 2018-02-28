//
//  TripCell.h
//  FlixBusApp
//
//  Created by Andrey on 2/19/18.
//  Copyright © 2018 Andrey. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Trip.h"

@interface TripCell : UITableViewCell

- (void)configureWithTrip:(Trip *)trip;

@end
