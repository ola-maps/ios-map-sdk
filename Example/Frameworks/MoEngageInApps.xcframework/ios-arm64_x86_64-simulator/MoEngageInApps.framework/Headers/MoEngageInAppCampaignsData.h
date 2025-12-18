//
//  MoEngageInAppCampaignsData.h
//  MoEngageInApps
//
//  Created by Chengappa C D on 20/06/18.
//  Copyright © 2018 MoEngage. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MoEngageInAppCampaignMeta.h"
#import "MoEngageInAppState.h"

@interface MoEngageInAppCampaignsData : NSObject<NSCoding>
@property NSArray<MoEngageInAppCampaignMeta *>   *generalInApps;
@property NSArray<MoEngageInAppCampaignMeta *>   *triggerInApps;
@property NSArray<MoEngageInAppCampaignMeta *>   *embeddedInApps;
@property NSArray<MoEngageInAppCampaignMeta *>   *selfHandledInApps;

@property NSArray<MoEngageInAppState *>   *inAppStateData;
@property NSNumber  *globalDelay;
@property NSNumber  *syncDelay;
@property NSDate    *inAppLastUpdatedTime;
@property NSDate    *inAppLastShownTime;

@property NSMutableDictionary<NSString *, NSMutableArray<MoEngageInAppCampaignMeta *> *> *nonIntrusiveInApps;
@end

