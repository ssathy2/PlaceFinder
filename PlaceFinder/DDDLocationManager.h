//
//  DDDLocationManager.h
//  PlaceFinder
//
//  Created by Sidd Sathyam on 12/22/13.
//  Copyright (c) 2013 dotdotdot. All rights reserved.
//

#import "DDDManagerBase.h"
#import <CoreLocation/CoreLocation.h>

static NSString *kLocationManagerLocationChangedNotification	= @"kLocationManagerLocationChangedNotification";
static NSString *kLocationManagerHeadingChangedNotification		= @"kLocationManagerHeadingChangedNotification";
static NSString *kLocationManagerNotificationCurrentLocationKey = @"kLocationManagerNotificationCurrentLocationKey";
static NSString *kLocationManagerNotificationCurrentHeadingKey	= @"kLocationManagerNotificationCurrentHeadingKey";

@interface DDDLocationManager : DDDManagerBase<CLLocationManagerDelegate>
@property (strong, nonatomic) CLLocationManager *locationManager;

- (void)start;
- (void)stop;
@end
