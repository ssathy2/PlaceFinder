//
//  DDDLocationManager.m
//  PlaceFinder
//
//  Created by Sidd Sathyam on 12/22/13.
//  Copyright (c) 2013 dotdotdot. All rights reserved.
//

#import "DDDLocationManager.h"

@interface DDDLocationManager()
@property (weak, nonatomic) CLLocation	*currentLocation;
@property (weak, nonatomic) CLHeading	*currentHeading;
@end
@implementation DDDLocationManager
CREATE_SHARED_INSTANCE
- (id)init
{
	self = [super init];
	if (self)
	{
		self.locationManager = [[CLLocationManager alloc] init];
		[self locationManagerSetup];
	}
	return self;
}

- (void)locationManagerSetup
{
	self.locationManager.delegate = self;
	self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
}

- (void)start
{
	[self.locationManager startMonitoringSignificantLocationChanges];
}

- (void)stop
{
	[self.locationManager stopMonitoringSignificantLocationChanges];
}


#pragma mark - CLLocationMangerDelegate
- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
	CLLocation *location = locations[0];
	self.currentLocation = location;
	
	NSNotification *locationChangedNotification = [[NSNotification alloc] initWithName:kLocationManagerLocationChangedNotification object:self userInfo:@{kLocationManagerNotificationCurrentLocationKey : location}];
	[[NSNotificationCenter defaultCenter] postNotification:locationChangedNotification];
}

- (void)locationManager:(CLLocationManager *)manager didUpdateHeading:(CLHeading *)newHeading
{
	self.currentHeading = newHeading;
	
	NSNotification *locationChangedNotification = [[NSNotification alloc] initWithName:kLocationManagerHeadingChangedNotification object:self userInfo:@{kLocationManagerNotificationCurrentHeadingKey : newHeading}];
	[[NSNotificationCenter defaultCenter] postNotification:locationChangedNotification];
}

@end
