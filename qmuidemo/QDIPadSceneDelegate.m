//
//  QDIPadSceneDelegate.m
//  qmuidemo
//
//  Created by king on 2021/4/30.
//  Copyright © 2021 QMUI Team. All rights reserved.
//

#import "QDIPadMainViewController.h"
#import "QDIPadSceneDelegate.h"
#import "QDLaunchHelper.h"

@implementation QDIPadSceneDelegate
- (void)scene:(UIScene *)scene willConnectToSession:(UISceneSession *)session options:(UISceneConnectionOptions *)connectionOptions {
    if (![scene isKindOfClass:UIWindowScene.class]) {
        return;
    }

    self.window                    = [[UIWindow alloc] initWithWindowScene:(UIWindowScene *)scene];
    self.window.rootViewController = [[QDIPadMainViewController alloc] init];
    [self.window makeKeyAndVisible];
    [QDLaunchHelper startLaunchingAnimationAtWindow:self.window];
}

- (NSUserActivity *)stateRestorationActivityForScene:(UIScene *)scene {
    return scene.userActivity;
}

- (void)sceneDidBecomeActive:(UIScene *)scene {
    
}
@end

