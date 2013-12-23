//
//  DDDPlaceSearchResultsResponse.h
//  PlaceFinder
//
//  Created by Sidd Sathyam on 12/22/13.
//  Copyright (c) 2013 dotdotdot. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DDDBaseResponse.h"
typedef NS_ENUM(NSInteger, DDDPlaceSearchResultsResponseStatus)
{
	DDDPlaceSearchResultsResponseStatusOK,
	DDDPlaceSearchResultsResponseStatusZERO_RESULTS,
	DDDPlaceSearchResultsResponseStatusOVER_QUERY_LIMIT,
	DDDPlaceSearchResultsResponseStatusREQUEST_DENIED,
	DDDPlaceSearchResultsResponseStatusINVALID_REQUEST
};

@interface DDDPlaceSearchResultsResponse : DDDBaseResponse
@property (strong, nonatomic) NSArray								*debug_info;
@property (strong, nonatomic) NSArray								*html_attributions;
@property (strong, nonatomic) NSArray								*results;
@property (assign, nonatomic) DDDPlaceSearchResultsResponseStatus	response_status;
@end
