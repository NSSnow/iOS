//
//  SNOWAttendee.m
//  NSSnow
//
//  Created by Kyle Fuller on 27/02/2014.
//  Copyright (c) 2014 NSSnow. All rights reserved.
//

#import "SNOWAttendee.h"

@interface SNOWAttendee () <MTLJSONSerializing>

@end

@implementation SNOWAttendee

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
        NSStringFromSelector(@selector(name)): @"name",
    };
}

@end
