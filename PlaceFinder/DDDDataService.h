//
//  SSDataService.h
//  SWAiOS
//
//  Created by Sidd Sathyam on 12/14/13.
//  Copyright (c) 2013 dotdotdot. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFHTTPRequestOperationManager.h"

typedef NS_ENUM(NSInteger, DDDDataServiceHTTPMethod){
	DDDDataServiceHTTPMethodGET,
	DDDDataServiceHTTPMethodPOST,
	DDDDataServiceHTTPMethodDELETE
};

typedef void (^DDDURLJSONResponseCallback)(NSDictionary *jsonResponse, NSError *error);

@interface DDDDataService : NSObject

- (void)fetchJSONatURL:(NSURL *)url withHTTPMethod:(DDDDataServiceHTTPMethod)httpMethod postBody:(NSString*)body headers:(NSDictionary *)headers withCallback:(DDDURLJSONResponseCallback)callback;

- (void) clearDataServiceCookies;

@end
