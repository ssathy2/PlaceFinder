//
//  DDDManagerBase.h
//  SWAiOS
//
//  Created by Sidd Sathyam on 12/15/13.
//  Copyright (c) 2013 dotdotdot. All rights reserved.
//

#import <Foundation/Foundation.h>

#ifndef CREATE_SHARED_INSTANCE
	#define CREATE_SHARED_INSTANCE						\
		+ (instancetype) sharedInstance					\
		{												\
			static id sharedInstance;					\
			static dispatch_once_t onceToken;			\
			dispatch_once(&onceToken, ^{				\
				sharedInstance = [[self alloc] init];	\
			});											\
			return sharedInstance;						\
		}
#endif

@interface DDDManagerBase : NSObject
+ (instancetype)sharedInstance;
@end
