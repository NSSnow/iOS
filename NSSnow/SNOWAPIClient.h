//
//  SNOWAPIClient.h
//  NSSnow
//
//  Created by Kyle Fuller on 27/02/2014.
//  Copyright (c) 2014 NSSnow. All rights reserved.
//

#import "AFHTTPRequestOperationManager.h"

@interface SNOWAPIClient : AFHTTPRequestOperationManager

+ (instancetype)sharedClient;

@end
