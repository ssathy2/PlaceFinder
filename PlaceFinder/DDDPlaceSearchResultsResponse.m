//
//  DDDPlaceSearchResultsResponse.m
//  PlaceFinder
//
//  Created by Sidd Sathyam on 12/22/13.
//  Copyright (c) 2013 dotdotdot. All rights reserved.
//

#import "DDDPlaceSearchResultsResponse.h"
#import "DDDPlaceSearchResult.h"

@implementation DDDPlaceSearchResultsResponse
- (id)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if (self)
	{
		[self setValuesForKeysWithDictionary:dictionary];
	}
	return self;
}

- (void)setValue:(id)value forKey:(NSString *)key
{
	if ([key isEqualToString:@"results"])
	{
		NSMutableArray *array = [NSMutableArray array];
		NSArray *resultsArray = (NSArray*)value;
		for (NSDictionary *dict in resultsArray)
		{
			[array addObject:[[DDDPlaceSearchResult alloc] initWithDictionary:dict]];
		}
		self.results = [array copy];
	}
	else if ([key isEqualToString:@"response_status"])
	{
		if ([value isEqualToString:@"OK"])
		{
			self.response_status = DDDPlaceSearchResultsResponseStatusOK;
		}
		else if([value isEqualToString:@"ZERO_RESULTS"])
		{
			self.response_status = DDDPlaceSearchResultsResponseStatusZERO_RESULTS;
		}
		else if([value isEqualToString:@"OVER_QUERY_LIMIT"])
		{
			self.response_status = DDDPlaceSearchResultsResponseStatusOVER_QUERY_LIMIT;
		}
		else if([value isEqualToString:@"REQUEST_DENIED"])
		{
			self.response_status = DDDPlaceSearchResultsResponseStatusREQUEST_DENIED;
		}
		else if([value isEqualToString:@"INVALID_REQUEST"])
		{
			self.response_status = DDDPlaceSearchResultsResponseStatusINVALID_REQUEST;
		}
		
	}
	else
	{
		[super setValue:value forKey:key];
	}
}
@end
