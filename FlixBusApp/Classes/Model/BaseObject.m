//
//  BaseObject.m
//  FlixBusApp
//
//  Created by Andrey on 2/18/18.
//  Copyright © 2018 Andrey. All rights reserved.
//

#import "BaseObject.h"

@implementation BaseObject

static NSDateFormatter *baseDateFormatter;

+ (void)initialize {
    if (baseDateFormatter == nil) {
        baseDateFormatter = [[NSDateFormatter alloc] init];
        [baseDateFormatter setDateFormat:@"yyyy-MM-dd"];
    }
}

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    self = [self init];
    if (self) {
        [self updateFromDictionary:dictionary];
    }
    
    return self;
}

- (void)updateFromDictionary:(NSDictionary *)dictionary {
    
}

@end
