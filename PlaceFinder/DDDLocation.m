//
//  DDDLocation.m
//  PlaceFinder
//
//  Created by Sidd Sathyam on 12/22/13.
//  Copyright (c) 2013 dotdotdot. All rights reserved.
//

#import "DDDLocation.h"

@implementation DDDLocation
- (id)initWithServiceLocationResponse:(DDDPlaceLocationResponse *)response
{
	self = [super init];
	if (self)
	{
		self.locationLatitude	= response.lat;
		self.locationLongitude	= response.lng;
	}
	return self;
}

- (id)initWithCLLocation:(CLLocation *)location
{
	self = [super init];
	if (self)
	{
		self.locationLatitude	= [NSNumber numberWithDouble: location.coordinate.latitude];
		self.locationLongitude	= [NSNumber numberWithDouble: location.coordinate.longitude];
	}
	return self;
}
@end
