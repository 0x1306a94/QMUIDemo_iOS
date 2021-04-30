//
//  QDSceneHelper.h
//  qmuidemo
//
//  Created by king on 2021/4/30.
//  Copyright © 2021 QMUI Team. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

FOUNDATION_EXTERN NSString *const iPadActivityIdentifier;

FOUNDATION_EXTERN NSString *const iPhoneActivityIdentifier;

API_AVAILABLE(ios(13.0))
@interface QDSceneHelper : NSObject
+ (NSString *)launMainActivityIdentifier;

+ (UISceneConfiguration *)sceneConfiguration:(NSString *)identifier sessionRole:(UISceneSessionRole)sessionRole;

+ (void)clearHistory;
@end

NS_ASSUME_NONNULL_END

