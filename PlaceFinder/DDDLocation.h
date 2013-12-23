//
//  DDDLocation.h
//  PlaceFinder
//
//  Created by Sidd Sathyam on 12/22/13.
//  Copyright (c) 2013 dotdotdot. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DDDPlaceLocationResponse.h"

@interface DDDLocation : NSObject
@property (strong, nonatomic) NSNumber *locationLatitude;
@property (strong, nonatomic) NSNumber *locationLongitude;

- (id)initWithServiceLocationResponse:(DDDPlaceLocationResponse*)response;
- (id)initWithCLLocation:(CLLocation*)location;
@end
