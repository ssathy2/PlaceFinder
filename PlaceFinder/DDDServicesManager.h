//
//  SSServicesManager.h
//  SWAiOS
//
//  Created by Sidd Sathyam on 12/14/13.
//  Copyright (c) 2013 dotdotdot. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DDDManagerBase.h"
#import "DDDLocation.h"
#import "DDDPlaceSearchResult.h"

@interface DDDServicesManager : DDDManagerBase
- (void)interestingPlacesNearLocation:(DDDLocation*)location withRadius:(NSNumber*)radiusInMeters withCallback:(void (^)(NSArray *results, NSError *error))callback;
@end
