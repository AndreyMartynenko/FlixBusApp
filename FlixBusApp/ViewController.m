//
//  ViewController.m
//  FlixBusApp
//
//  Created by Andrey on 2/18/18.
//  Copyright © 2018 Andrey. All rights reserved.
//

#import "ViewController.h"
#import "CacheManager.h"
#import "ServicesHub.h"
#import "Timetable.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewDidAppear:(BOOL)animated {
    [[ServicesHub sharedInstance].timetableService retrieveTimetableDataSuccess:^(id object) {
        NSLog(@"__timetableService: success");
        
        Timetable *timetable = (Timetable *)object;
        NSLog(@"__blah");
        
    } failure:^(NSError *error) {
        NSLog(@"__timetableService: failure");
    }];
}

//- (void)updateHistoricalData {
//    [[ServicesHub sharedInstance].historicalService retrieveHistoricalDataWithCurrency:@"EUR" startDate:[self getStartDate] endDate:[NSDate date] success:^(id object) {
//        NSLog(@"__historicalService: success");
//
//        Historical *historical = (Historical *)object;
//        self.historicalBPI = historical.bpi;
//        [[CacheManager sharedInstance] persistDictionary:self.historicalBPI];
//
//        [self sortHistoricalBPIValues];
//
//        self.graphTitleLabel.text = @"Historical exchange rate of Bitcoin/EUR";
//        [self.graphView updateContentWithValues:self.sortedHistoricalBPIValues delegate:self];
//
//    } failure:^(NSError *error) {
//        NSLog(@"__historicalService: failure");
//
//    }];
//}

@end
