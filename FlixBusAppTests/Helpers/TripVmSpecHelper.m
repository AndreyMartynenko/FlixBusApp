//
//  TripVmSpecHelper.m
//  FlixBusAppTests
//
//  Created by Andrey on 2/20/18.
//  Copyright © 2018 Andrey. All rights reserved.
//

#import "TripVmSpecHelper.h"
#import <OHHTTPStubs/OHHTTPStubs.h>
#import <OHHTTPStubs/OHPathHelpers.h>

@implementation TripVmSpecHelper

+ (id<OHHTTPStubsDescriptor>)enableValidResponseNetworkStub {
    id<OHHTTPStubsDescriptor> descriptor = [OHHTTPStubs stubRequestsPassingTest:^BOOL(NSURLRequest *request) {
        return YES;
    } withStubResponse:^OHHTTPStubsResponse*(NSURLRequest *request) {
        NSString *fixture = OHPathForFile(@"validTimetableResponse.json", self.class);
        return [OHHTTPStubsResponse responseWithFileAtPath:fixture
                                                statusCode:200
                                                   headers:@{@"Content-Type":@"application/json",
                                                             @"X-Api-Authentication":@"intervIEW_TOK3n"}];
    }];
    
    [OHHTTPStubs setEnabled:YES];
    
    return descriptor;
}

+ (void)disableAllNetworkStubs {
    [OHHTTPStubs removeAllStubs];
}

@end
