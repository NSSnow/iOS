//
//  SNOWEvent.m
//  NSSnow
//
//  Created by Kyle Fuller on 27/02/2014.
//  Copyright (c) 2014 NSSnow. All rights reserved.
//

#import "SNOWEvent.h"
#import "SNOWAttendee.h"
#import "SNOWAPIClient.h"


@interface SNOWEvent () <MTLJSONSerializing>

@end

@implementation SNOWEvent

+ (void)get:(void (^)(NSArray *events, NSError *error))completion {
    [[SNOWAPIClient sharedClient] GET:@"event" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSMutableArray *events = [NSMutableArray array];

        for (NSDictionary *eventDictionary in responseObject) {
            SNOWEvent *event = [MTLJSONAdapter modelOfClass:self fromJSONDictionary:eventDictionary error:nil];
            [events addObject:event];
        }

        completion([events copy], nil);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        completion(nil, error);
    }];
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
        NSStringFromSelector(@selector(URL)): @"url",
        NSStringFromSelector(@selector(attendees)): @"attendees",
    };
}

+ (NSValueTransformer *)URLJSONTransformer {
    return [NSValueTransformer valueTransformerForName:MTLURLValueTransformerName];
}

+ (NSValueTransformer *)attendeesJSONTransformer {
    return [NSValueTransformer mtl_JSONArrayTransformerWithModelClass:SNOWAttendee.class];
}

@end
