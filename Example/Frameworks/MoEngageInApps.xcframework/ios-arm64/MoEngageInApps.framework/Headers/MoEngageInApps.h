//
//  MoEngageInApps.h
//  MoEngageInApps
//
//  Created by Chengappa C D on 20/10/21.
//  Copyright © 2021 MoEngage. All rights reserved.
//

#if !defined(__has_include)
#error Umbrella header not found use "@import" to import module
#else

#if __has_include(<MoEngageInApps/MoEngageInApps-umbrella.h>)
#import <MoEngageInApps/MoEngageInApps-umbrella.h>
#elif TARGET_OS_IOS && __has_include(<MoEngageInApps/MoEngageInApps-framework-iOS-umbrella.h>)
#import <MoEngageInApps/MoEngageInApps-framework-iOS-umbrella.h>
#elif TARGET_OS_TV && __has_include(<MoEngageInApps/MoEngageInApps-framework-tvOS-umbrella.h>)
#import <MoEngageInApps/MoEngageInApps-framework-tvOS-umbrella.h>
#elif TARGET_OS_IOS && __has_include(<MoEngageInApps/MoEngageInApps-library-iOS-umbrella.h>)
#import <MoEngageInApps/MoEngageInApps-library-iOS-umbrella.h>
#elif TARGET_OS_TV && __has_include(<MoEngageInApps/MoEngageInApps-library-tvOS-umbrella.h>)
#import <MoEngageInApps/MoEngageInApps-library-tvOS-umbrella.h>
#elif TARGET_OS_IOS && __has_include(<MoEngageInApps/MoEngageInApps-iOS-umbrella.h>)
#import <MoEngageInApps/MoEngageInApps-iOS-umbrella.h>
#elif TARGET_OS_TV && __has_include(<MoEngageInApps/MoEngageInApps-tvOS-umbrella.h>)
#import <MoEngageInApps/MoEngageInApps-tvOS-umbrella.h>
#elif __has_include(<MoEngageInApps/MoEngageInApps-framework-umbrella.h>)
#import <MoEngageInApps/MoEngageInApps-framework-umbrella.h>
#elif __has_include(<MoEngageInApps/MoEngageInApps-library-umbrella.h>)
#import <MoEngageInApps/MoEngageInApps-library-umbrella.h>
#else
#error Umbrella header not found use "@import" to import module
#endif
#endif
