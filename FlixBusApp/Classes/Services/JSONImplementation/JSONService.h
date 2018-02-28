//
//  JSONService.h
//  FlixBusApp
//
//  Created by Andrey on 2/18/18.
//  Copyright © 2018 Andrey. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AFNetworking/AFNetworking.h>
#import "ServicesBlocks.h"

@interface JSONService : NSObject

@property (strong, nonatomic) AFHTTPSessionManager *sessionManager;

+ (NSURL *)baseServiceURL;
+ (AFHTTPRequestSerializer <AFURLRequestSerialization> *)requestSerializer;

- (void)request:(NSString *)path parameters:(NSDictionary *)parameters success:(RequestSuccessBlock)successBlock failure:(FailureBlock)failureBlock;

@end

// NSError userInfo key that will contain response data
static NSString * const JSONResponseSerializerWithDataKey = @"JSONError";

@interface JSONResponseSerializerWithData : AFJSONResponseSerializer

@end
