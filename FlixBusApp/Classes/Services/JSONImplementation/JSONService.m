//
//  JSONService.m
//  FlixBusApp
//
//  Created by Andrey on 2/18/18.
//  Copyright © 2018 Andrey. All rights reserved.
//

#import "JSONService.h"
#import "ServicesHub.h"

static NSString * const devServerStaging = @"http://api.mobile.staging.mfb.io/";
static NSString * const authHeaderKey = @"X-Api-Authentication";
static NSString * const authHeaderValue = @"intervIEW_TOK3n";

@interface JSONService()

@end

@implementation JSONService

+ (NSURL *)baseServiceURL {
    return [[NSURL alloc] initWithString:devServerStaging];
}

+ (AFHTTPRequestSerializer<AFURLRequestSerialization> *)requestSerializer {
    AFHTTPRequestSerializer<AFURLRequestSerialization> *requestSerializer = [AFJSONRequestSerializer serializer];
    [requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-type"];
    [requestSerializer setValue:authHeaderValue forHTTPHeaderField:authHeaderKey];

    return requestSerializer;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        [self setupSessionManager];
    }
    
    return self;
}

- (void)setupSessionManager {
    self.sessionManager = [[AFHTTPSessionManager alloc] initWithBaseURL:[[self class] baseServiceURL]];
    [self.sessionManager setRequestSerializer:[[self class] requestSerializer]];
    [self.sessionManager setResponseSerializer:[[JSONResponseSerializerWithData alloc] init]];
    
    self.sessionManager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/plain", @"application/javascript", nil];
    self.sessionManager.session.configuration.timeoutIntervalForRequest = 10.0f;
}

- (void)request:(NSString *)path parameters:(NSDictionary *)parameters success:(RequestSuccessBlock)successBlock failure:(FailureBlock)failureBlock {
    if (self.sessionManager.baseURL == nil)
        [self setupSessionManager];
    
    [self.sessionManager GET:path parameters:parameters progress:^(NSProgress * _Nonnull downloadProgress) {
        ;
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        successBlock(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failureBlock(error);
    }];
}

@end

@implementation JSONResponseSerializerWithData

- (id)responseObjectForResponse:(NSURLResponse *)response data:(NSData *)data error:(NSError *__autoreleasing *)error {
    if (![self validateResponse:(NSHTTPURLResponse *)response data:data error:error]) {
        if (*error != nil) {
            NSMutableDictionary *userInfo = [(*error).userInfo mutableCopy];
            NSError *jsonError = nil;
            NSDictionary *errors = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&jsonError];
            if (jsonError) {
                userInfo[JSONResponseSerializerWithDataKey] = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
                NSError *newError = [NSError errorWithDomain:(*error).domain code:(*error).code userInfo:userInfo];
                (*error) = newError;
            }
            else {
                userInfo[JSONResponseSerializerWithDataKey] = errors;
                NSError *newError = [NSError errorWithDomain:(*error).domain code:(*error).code userInfo:userInfo];
                (*error) = newError;
            }
        }
        
        return (nil);
    }
    
    return ([super responseObjectForResponse:response data:data error:error]);
}

@end
