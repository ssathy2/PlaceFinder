//
//  DDDPlaceSearchResultResponse.m
//  PlaceFinder
//
//  Created by Sidd Sathyam on 12/22/13.
//  Copyright (c) 2013 dotdotdot. All rights reserved.
//

#import "DDDPlaceSearchResult.h"

@implementation DDDPlaceSearchResult
- (void)setValue:(id)value forKey:(NSString *)key
{
	if ([key isEqualToString:@"geometry"])
	{
		NSDictionary *geometryDict = (NSDictionary*)value;
		NSDictionary *locationDict = (NSDictionary*)[geometryDict valueForKey:@"location"];
		self.geometry = [[DDDPlaceLocationResponse alloc] initWithDictionary:locationDict];
	}
	else
	{
		[super setValue:value forUndefinedKey:key];
	}
}
@end
