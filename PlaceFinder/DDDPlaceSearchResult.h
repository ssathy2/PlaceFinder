//
//  DDDPlaceSearchResultResponse.h
//  PlaceFinder
//
//  Created by Sidd Sathyam on 12/22/13.
//  Copyright (c) 2013 dotdotdot. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DDDPlaceLocationResponse.h"
#import "DDDBaseResponse.h"
//typedef NS_ENUM(NSInteger, DDDSupportedPlaceType)
//{
//	DDDSupportedPlaceType
//};

@interface DDDPlaceSearchResult : DDDBaseResponse
@property (strong, nonatomic) NSString					*formatted_address;
@property (strong, nonatomic) DDDPlaceLocationResponse	*geometry;
@property (strong, nonatomic) NSString					*icon;
@property (strong, nonatomic) NSString					*name;
@property (strong, nonatomic) NSNumber					*rating;
@property (strong, nonatomic) NSString					*reference;
@end
