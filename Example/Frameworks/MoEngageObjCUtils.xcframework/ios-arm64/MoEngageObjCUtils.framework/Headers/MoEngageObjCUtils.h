//
//  MoEngageObjCUtils.h
//  MoEngageObjCUtils
//
//  Created by Chengappa C D on 23/09/21.
//  Copyright © 2021 MoEngage. All rights reserved.
//

#if !defined(__has_include)
#error Umbrella header not found use "@import" to import module
#else

#if __has_include(<MoEngageObjCUtils/MoEngageObjCUtils-umbrella.h>)
#import <MoEngageObjCUtils/MoEngageObjCUtils-umbrella.h>
#elif TARGET_OS_IOS && __has_include(<MoEngageObjCUtils/MoEngageObjCUtils-framework-iOS-umbrella.h>)
#import <MoEngageObjCUtils/MoEngageObjCUtils-framework-iOS-umbrella.h>
#elif TARGET_OS_TV && __has_include(<MoEngageObjCUtils/MoEngageObjCUtils-framework-tvOS-umbrella.h>)
#import <MoEngageObjCUtils/MoEngageObjCUtils-framework-tvOS-umbrella.h>
#elif TARGET_OS_IOS && __has_include(<MoEngageObjCUtils/MoEngageObjCUtils-library-iOS-umbrella.h>)
#import <MoEngageObjCUtils/MoEngageObjCUtils-library-iOS-umbrella.h>
#elif TARGET_OS_TV && __has_include(<MoEngageObjCUtils/MoEngageObjCUtils-library-tvOS-umbrella.h>)
#import <MoEngageObjCUtils/MoEngageObjCUtils-library-tvOS-umbrella.h>
#elif TARGET_OS_IOS && __has_include(<MoEngageObjCUtils/MoEngageObjCUtils-iOS-umbrella.h>)
#import <MoEngageObjCUtils/MoEngageObjCUtils-iOS-umbrella.h>
#elif TARGET_OS_TV && __has_include(<MoEngageObjCUtils/MoEngageObjCUtils-tvOS-umbrella.h>)
#import <MoEngageObjCUtils/MoEngageObjCUtils-tvOS-umbrella.h>
#elif __has_include(<MoEngageObjCUtils/MoEngageObjCUtils-framework-umbrella.h>)
#import <MoEngageObjCUtils/MoEngageObjCUtils-framework-umbrella.h>
#elif __has_include(<MoEngageObjCUtils/MoEngageObjCUtils-library-umbrella.h>)
#import <MoEngageObjCUtils/MoEngageObjCUtils-library-umbrella.h>
#else
#error Umbrella header not found use "@import" to import module
#endif
#endif
