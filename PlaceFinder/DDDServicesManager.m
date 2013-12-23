//
//  SSServicesManager.m
//  SWAiOS
//
//  Created by Sidd Sathyam on 12/14/13.
//  Copyright (c) 2013 dotdotdot. All rights reserved.
//

#import "DDDServicesManager.h"
#import "DDDDataService.h"
#import "DDDPlaceSearchResultsResponse.h"

static NSString *kAPIKeyRequstKey	= @"key";
static NSString *kAPIKeyValue		= @"AIzaSyDONygMPishgpCz8surCo2WbUWE1hwUOgY";
static NSString *kAPILocationKey	= @"location";
static NSString *kAPIRadiusKey		= @"radius";
static NSString *kAPISensorKey		= @"sensor";
static NSString *kAPISensorValue	= @"true";

@interface DDDServicesManager()
@property (strong, nonatomic) DDDDataService *dataService;
@property (strong, nonatomic) NSURL			*baseURL;
@end

@implementation DDDServicesManager
CREATE_SHARED_INSTANCE

- (instancetype)init
{
	self = [super init];
	if (self)
	{
		self.dataService = [[DDDDataService alloc] init];
		self.baseURL = [NSURL URLWithString:@"https://maps.googleapis.com/maps/api/place/nearbysearch/json?"];
	}
	return self;
	
}

#pragma mark - Private helpers
- (NSString*)bodyFromDictionary:(NSDictionary*)dict
{
	NSMutableArray *arr = [NSMutableArray array];
	for (NSString *key in dict)
	{
		NSString *s;
		if ([key isEqualToString:kAPILocationKey])
		{
			DDDLocation *location = (DDDLocation*)dict[key];
			s = [NSString stringWithFormat:@"%@=%@,%@", key, location.locationLatitude, location.locationLongitude];
		}
		else
		{
			s = [NSString stringWithFormat:@"%@=%@", key, dict[key]];
		}
		[arr addObject:s];
	}
	return [arr componentsJoinedByString:@"&"];
}

- (void)interestingPlacesNearLocation:(DDDLocation *)location withRadius:(NSNumber*)radiusInMeters withCallback:(void (^)(NSArray *results, NSError *error))callback
{
	NSDictionary *requestParams = @{kAPIKeyRequstKey: kAPIKeyValue,
									kAPILocationKey	: location,
									kAPIRadiusKey	: radiusInMeters,
									kAPISensorKey	: kAPISensorValue
									};
	NSString *fullURL = [NSString stringWithFormat:@"%@%@", self.baseURL.absoluteString, [self bodyFromDictionary:requestParams]];
	NSURL *requestURL = [NSURL URLWithString:fullURL];
	[self.dataService fetchJSONatURL:requestURL withHTTPMethod:DDDDataServiceHTTPMethodGET postBody:nil headers:nil withCallback:^(NSDictionary *jsonResponse, NSError *error) {
		DDDPlaceSearchResultsResponse *response = [[DDDPlaceSearchResultsResponse alloc] initWithDictionary:jsonResponse];
		// TODO: handle ERROR cases
		if (response.response_status != DDDPlaceSearchResultsResponseStatusOK || response.response_status != DDDPlaceSearchResultsResponseStatusZERO_RESULTS)
		{
			callback(response.results, nil);
		}
		else
		{

		}
	}];
}


@end
