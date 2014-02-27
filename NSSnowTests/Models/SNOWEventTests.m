//
//  SNOWEventTests.m
//  NSSnow
//
//  Created by Kyle Fuller on 27/02/2014.
//  Copyright (c) 2014 NSSnow. All rights reserved.
//

#import <XCTest/XCTest.h>
#define EXP_SHORTHAND
#import <Expecta/Expecta.h>
#import "SNowEvent.h"


@interface SNOWEventTests : XCTestCase

@end

@implementation SNOWEventTests

- (void)testFetchesAllEventsFromAPI {
    __block NSArray *futureEvents;

    [SNOWEvent get:^(NSArray *events, NSError *error) {
        futureEvents = events;
    }];

    expect([futureEvents count]).will.equal(1);
    expect([[[futureEvents firstObject] attendees] count]).to.equal(1);
}

@end
