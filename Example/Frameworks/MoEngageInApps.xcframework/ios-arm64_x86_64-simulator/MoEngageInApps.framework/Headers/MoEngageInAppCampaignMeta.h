//
//  MoEngageInAppCampaignMeta.h
//  MoEngageInApps
//
//  Created by Chengappa C D on 13/06/18.
//  Copyright © 2018 MoEngage. All rights reserved.
//

#import "MoEngageModelObject.h"
#import "MoEngageInAppDisplay.h"
#import "MoEngageInAppDeliveryControl.h"
#import "MoEngageInAppTriggerCondition.h"
#import "MoEngageInAppCommonUtils.h"

@class MoEngageSDKInstance;

typedef NS_ENUM(NSInteger, MoEngageInAppCampaignSubType) {
    MoEngageInAppCampaignSubTypeGeneral,
    MoEngageInAppCampaignSubTypeoptIn
};
typedef NS_ENUM(NSUInteger, MoEngageNudgeDisplayPosition) {
    MoEngageNudgeDisplayPositionNone,
    MoEngageNudgeDisplayPositionTop,
    MoEngageNudgeDisplayPositionBottom,
    MoEngageNudgeDisplayPositionBottomLeft,
    MoEngageNudgeDisplayPositionBottomRight
};


@interface MoEngageInAppCampaignMeta : MoEngageModelObject <NSCoding>
@property(nonatomic, strong) NSString* _Nullable instance_id;
@property(nonatomic, strong) NSString* _Nonnull campaign_id;
@property(nonatomic, strong) NSString* _Nullable formatted_campaign_id;
@property(nonatomic, strong) NSString* _Nonnull campaign_name;
@property(nonatomic, strong) NSString* _Nullable campaign_type;
@property(nonatomic, assign) MoEngageInAppCampaignSubType campaign_sub_type;
@property(nonatomic, assign) MoEngageInAppType inapp_type;
@property(nonatomic, assign) MoEngageInAppTemplateType template_type;
@property(nonatomic, assign) MoEngageInAppSDKCampaignType sdk_campaign_type;
@property(nonatomic, assign) MoEngageInAppOrientationType orientation_supported;
@property(nonatomic, assign) MoEngageNudgeDisplayPosition position;

@property(nonatomic, strong) NSDate* _Nullable updated_time;
@property(nonatomic, strong) NSDate* _Nullable expiry_time;

@property(nonatomic, strong) NSDictionary<NSString *, id>*  _Nullable triggerJson;
@property(nonatomic, strong) MoEngageInAppDisplay* _Nonnull displayMeta;
@property(nonatomic, strong) MoEngageInAppDeliveryControl* _Nonnull deliveryControlMeta;

@property (nonatomic, strong) NSDictionary<NSString *, id>* _Nullable campaign_context;

-(instancetype _Nullable )initWithDictionary:(NSDictionary*_Nonnull)metaDict sdkInstance:(MoEngageSDKInstance*_Nonnull)sdkInstance;
-(BOOL)isCampaignMetaValid;
@end
