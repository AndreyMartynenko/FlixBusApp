//
//  TimetableService.h
//  FlixBusApp
//
//  Created by Andrey on 2/19/18.
//  Copyright © 2018 Andrey. All rights reserved.
//

#import "ServicesBlocks.h"

@protocol TimetableService <NSObject>

- (void)retrieveTimetableDataSuccess:(SuccessObjectBlock)successBlock failure:(FailureBlock)failureBlock;

@end

