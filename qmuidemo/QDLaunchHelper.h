//
//  QDLaunchHelper.h
//  qmuidemo
//
//  Created by king on 2021/4/30.
//  Copyright © 2021 QMUI Team. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface QDLaunchHelper : NSObject

+ (__kindof UIViewController *)generateWindowRootViewController;

+ (void)startLaunchingAnimationAtWindow:(__kindof UIWindow *)window;
@end

NS_ASSUME_NONNULL_END

