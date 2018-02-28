//
//  TripCell.m
//  FlixBusApp
//
//  Created by Andrey on 2/19/18.
//  Copyright © 2018 Andrey. All rights reserved.
//

#import "TripCell.h"

@interface TripCell ()

@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UILabel *directionLabel;
@property (weak, nonatomic) IBOutlet UILabel *briefRouteLabel;

@end

@implementation TripCell

- (void)configureWithTrip:(Trip *)trip {
    self.timeLabel.text = trip.datetime.timeString;
    self.directionLabel.text = trip.lineDirection;
    self.briefRouteLabel.text = [NSString stringWithFormat:@"to %@", trip.throughTheStations];
}

@end
