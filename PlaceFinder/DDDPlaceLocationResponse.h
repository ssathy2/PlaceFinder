//
//  DDDPlaceLocationResponse.h
//  PlaceFinder
//
//  Created by Sidd Sathyam on 12/22/13.
//  Copyright (c) 2013 dotdotdot. All rights reserved.
//

#import "DDDBaseResponse.h"

@interface DDDPlaceLocationResponse : DDDBaseResponse
@property (strong, nonatomic) NSNumber *lat;
@property (strong, nonatomic) NSNumber *lng;
@end
