//
//  ServicesBlocks.h
//  FlixBusApp
//
//  Created by Andrey on 2/18/18.
//  Copyright © 2018 Andrey. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

typedef void (^RequestSuccessBlock)(id responseObject);
typedef void (^SuccessObjectBlock)(id object);
typedef void (^FailureBlock)(NSError* error);

