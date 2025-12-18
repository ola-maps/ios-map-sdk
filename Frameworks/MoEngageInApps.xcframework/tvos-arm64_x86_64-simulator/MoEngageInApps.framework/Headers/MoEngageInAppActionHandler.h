//
//  MoEngageInAppActionHandler.h
//  MoEngageInApps
//
//  Created by Chengappa C D on 12/07/18.
//  Copyright © 2018 MoEngage. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "MoEngageInAppViewPayload.h"
#import "MoEngageInAppContainerView.h"
#import "MoEngageStarRatingView.h"

@class MoEngageSDKConfig;
@class MoEngageInAppAction;
@class MoEngageInAppNavigationAction;

NS_ASSUME_NONNULL_BEGIN

@protocol MoEngageInAppActionHandlerDelegate <NSObject>
-(void)checkAndUpdatePrimaryClickedForCampaignID:(NSString*)campaignID;
-(void)dismissInAppWithCampaignID:(NSString*)campaignID;
-(MoEngageInAppPrimaryContainerView* _Nullable)getInAppViewWithCampaignID:(NSString*)campaignID;
-(void)informDelegateActionPerformedWithInfo:(MoEngageInAppAction*)actionInfo forCampaignID:(NSString*)campaignID;
-(void)performNavigationCallback:(MoEngageInAppNavigationAction *)action forCampaignID:(NSString*)campaignID;
@end

@interface MoEngageInAppActionHandler : NSObject
/**
 Method to initialize Action Handler
 */
-(instancetype)initWithSDKConfig:(MoEngageSDKConfig*)sdkConfig withSDKInstance:(MoEngageSDKInstance*)configController andDelegate:(id)delegate;
-(instancetype _Nonnull)init NS_UNAVAILABLE;

//Action Methods for widgets
-(void)buttonTapped:(UIButton *)sender;
-(void)closeButtonTapped:(UIButton *)sender;
-(void)imageViewTapped:(UIGestureRecognizer*)gestureRecognizer;
-(void)labelTapped:(UIGestureRecognizer*)gestureRecognizer;
-(void)ratingValueChanged:(id)sender;
-(void)customRatingValueChanged:(id)widget;

-(void)executeActions:(NSArray*)widgetActions forCampaignID:(NSString*)campaignID andInAppType:(MoEngageInAppType)type forWidget:(id _Nullable)widget;
@end


NS_ASSUME_NONNULL_END
