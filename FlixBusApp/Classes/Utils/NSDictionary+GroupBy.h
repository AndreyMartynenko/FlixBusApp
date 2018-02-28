//
//  NSDictionary+GroupBy.h
//  FlixBusApp
//
//  Created by Andrey on 2/19/18.
//  Copyright © 2018 Andrey. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary ()

//- (NSDictionary *)groupIntoDictionary:(id<NSCopying>(^)(id object))keyFromObjectCallback {
//    NSParameterAssert(keyFromObjectCallback);
//    NSMutableDictionary *result = [NSMutableDictionary dictionary];
//    for (id object in self) {
//        id<NSCopying> key = keyFromObjectCallback(object);
//        NSMutableArray *array = [result objectForKey:key];
//        if (array == nil) {
//            array = [NSMutableArray new];
//            [result setObject:array forKey:key];
//        }
//        [array addObject:object];
//    }
//    
//    return [result copy];
//}

@end
