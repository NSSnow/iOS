//
//  SNOWEvent.h
//  NSSnow
//
//  Created by Kyle Fuller on 27/02/2014.
//  Copyright (c) 2014 NSSnow. All rights reserved.
//

#import <Mantle/Mantle.h>

@interface SNOWEvent : MTLModel

+ (void)get:(void (^)(NSArray *events, NSError *error))completion;

@property (nonatomic, strong, readonly) NSURL *URL;
@property (nonatomic, strong, readonly) NSArray *attendees;

@end
