//
//  SSDataService.m
//  SWAiOS
//
//  Created by Sidd Sathyam on 12/14/13.
//  Copyright (c) 2013 dotdotdot. All rights reserved.
//

#import "DDDDataService.h"

@interface DDDDataService()<NSURLConnectionDelegate>
@property (strong, nonatomic) NSMutableURLRequest *urlRequest;
@property (strong, nonatomic) NSURLConnection *urlConnection;

// TODO: Remove this
@property (nonatomic, assign) BOOL shouldPerformRelogin;
@end

@implementation DDDDataService

- (id)init
{
	self = [super init];
	if (self)
	{
		self.urlRequest = [[NSMutableURLRequest alloc] init];
		//self.urlConnection = [[NSURLConnection alloc] init];
//		self.responseSerializer = [AFHTTPResponseSerializer serializer];
//		self.requestSerializer = [AFHTTPRequestSerializer serializer];
//		self.shouldPerformRelogin = YES;
	}
	return self;
}

- (NSString*)httpMethodStringForEnum:(DDDDataServiceHTTPMethod)methodEnum
{
	NSString *methodString;
	switch (methodEnum) {
		case DDDDataServiceHTTPMethodDELETE:
			methodString = @"DELETE";
			break;
		case DDDDataServiceHTTPMethodGET:
			methodString = @"GET";
			break;
		case DDDDataServiceHTTPMethodPOST:
			methodString = @"POST";
			break;
		default:
			methodString = @"GET";
			break;
	}
	return methodString;
}

- (void) fetchJSONatURL:(NSURL *)url withHTTPMethod:(DDDDataServiceHTTPMethod)httpMethod postBody:(NSString *)body headers:(NSDictionary *)headers withCallback:(DDDURLJSONResponseCallback)callback
{
	self.urlRequest.URL = url;
	self.urlRequest.HTTPMethod = [self httpMethodStringForEnum:httpMethod];
	self.urlRequest.HTTPBody = [body dataUsingEncoding:NSUTF8StringEncoding];
	[self.urlRequest setHTTPShouldHandleCookies:YES];
	[self.urlRequest setHTTPShouldUsePipelining:YES];
	
	NSMutableDictionary *combinedDict = [NSMutableDictionary dictionaryWithDictionary: self.urlRequest.allHTTPHeaderFields];
	[combinedDict addEntriesFromDictionary:headers];
	[self.urlRequest setAllHTTPHeaderFields:combinedDict];
	
//	NSString* filePath;
//	if(self.shouldPerformRelogin)
//		filePath = [[NSBundle mainBundle] pathForResource:@"mockreloginresponse" ofType:@"json"];
//	else
//	{
//		filePath = [[NSBundle mainBundle] pathForResource:@"mockloginresponse" ofType:@"json"];
//		if (self.shouldPerformRelogin) self.shouldPerformRelogin = NO;
//	}
//	
//	NSData* data = [NSData dataWithContentsOfFile:filePath];
//	callback(data, nil);
	[NSURLConnection sendAsynchronousRequest:self.urlRequest queue:[NSOperationQueue currentQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
		if (data)
		{
			NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
			NSLog(@"Returned Serialized Dict: %@", dict);
			callback(dict, connectionError);
		}
		else
		{
			NSLog(@"ERROR in fetchJSONAtURL: %@", connectionError);
		}
		
	}];
}

- (void)clearDataServiceCookies
{
	
}

- (BOOL)connection:(NSURLConnection *)connection canAuthenticateAgainstProtectionSpace:(NSURLProtectionSpace *)protectionSpace {
	return [protectionSpace.authenticationMethod isEqualToString:NSURLAuthenticationMethodServerTrust];
}

- (void)connection:(NSURLConnection *)connection didReceiveAuthenticationChallenge:(NSURLAuthenticationChallenge *)challenge {
	[challenge.sender continueWithoutCredentialForAuthenticationChallenge:challenge];
}
@end
