//
//  TripVmSpec.m
//  FlixBusAppTests
//
//  Created by Andrey on 2/20/18.
//  Copyright © 2018 Andrey. All rights reserved.
//

#import <Specta/Specta.h>
#define EXP_SHORTHAND
#import <Expecta/Expecta.h>
#import <OCMock/OCMock.h>

#import "TripVm.h"
#import "TripVmSpecHelper.h"

@interface TripVm (Testing)

@end

SpecBegin(TripVm)

describe(@"TripVm", ^{
    
    __block TripVm *_sut;
    
    beforeEach(^{
        [TripVmSpecHelper enableValidResponseNetworkStub];
        _sut = [[TripVm alloc] initWithDelegate:nil];
    });
    
    afterEach(^{
        _sut = nil;
        [TripVmSpecHelper disableAllNetworkStubs];
    });
    
    context(@"arrivals", ^{
        
        describe(@"valid dataSource:", ^{
            
            it(@"should return valid amount of sections", ^{
                expect([_sut sectionCount]).will.equal(2);
            });
            
            it(@"should return valid title of sections", ^{
                expect([_sut sectionTitleAt:0]).will.equal(@"19/02/2018");
                expect([_sut sectionTitleAt:1]).will.equal(@"19/04/2016");
            });
            
            it(@"should return valid amount of items", ^{
                expect([_sut itemCountAtSection:0]).will.equal(1);
                expect([_sut itemCountAtSection:1]).will.equal(1);
            });
            
        });
        
    });
    
    context(@"departures", ^{
        
        describe(@"valid dataSource:", ^{
            
            it(@"should return valid amount of sections", ^{
                [_sut toggleDestination];
                
                expect([_sut sectionCount]).will.equal(1);
            });
            
            it(@"should return valid title of sections", ^{
                [_sut toggleDestination];

                expect([_sut sectionTitleAt:0]).will.equal(@"19/04/2016");
            });
            
            it(@"should return valid amount of items", ^{
                [_sut toggleDestination];

                expect([_sut itemCountAtSection:0]).will.equal(1);
            });
            
        });
        
    });
    
});

SpecEnd

