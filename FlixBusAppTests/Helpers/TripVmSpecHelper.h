//
//  TripVmSpecHelper.h
//  FlixBusAppTests
//
//  Created by Andrey on 2/20/18.
//  Copyright © 2018 Andrey. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <OHHTTPStubs/OHHTTPStubs.h>

@interface TripVmSpecHelper : NSObject

+ (id<OHHTTPStubsDescriptor>)enableValidResponseNetworkStub;

+ (void)disableAllNetworkStubs;

@end
