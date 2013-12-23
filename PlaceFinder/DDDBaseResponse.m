//
//  DDDBaseResponse.m
//  PlaceFinder
//
//  Created by Sidd Sathyam on 12/22/13.
//  Copyright (c) 2013 dotdotdot. All rights reserved.
//

#import "DDDBaseResponse.h"

@implementation DDDBaseResponse
- (id)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if (self)
	{
		[self setValuesForKeysWithDictionary:dictionary];
	}
	return self;
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
	
}
@end
