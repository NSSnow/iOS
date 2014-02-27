//
//  SNOWAPIClient.m
//  NSSnow
//
//  Created by Kyle Fuller on 27/02/2014.
//  Copyright (c) 2014 NSSnow. All rights reserved.
//

#import "SNOWAPIClient.h"

@implementation SNOWAPIClient

+ (instancetype)sharedClient {
    static dispatch_once_t onceToken;
    static SNOWAPIClient *client;

    dispatch_once(&onceToken, ^{
        client = [[SNOWAPIClient alloc] init];
    });

    return client;
}

- (instancetype)init {
    NSURL *baseURL = [NSURL URLWithString:@"http://nssnow.apiary.io/"];
    return [super initWithBaseURL:baseURL];
}

@end
