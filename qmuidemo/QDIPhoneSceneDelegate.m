//
//  QDIPhoneSceneDelegate.m
//  qmuidemo
//
//  Created by king on 2021/4/30.
//  Copyright © 2021 QMUI Team. All rights reserved.
//

#import "QDIPhoneSceneDelegate.h"

#import "QDLaunchHelper.h"

@implementation QDIPhoneSceneDelegate
- (void)scene:(UIScene *)scene willConnectToSession:(UISceneSession *)session options:(UISceneConnectionOptions *)connectionOptions {
    if (![scene isKindOfClass:UIWindowScene.class]) {
        return;
    }
    
    self.window = [[UIWindow alloc] initWithWindowScene:(UIWindowScene *)scene];
    self.window.rootViewController = [QDLaunchHelper generateWindowRootViewController];
    [self.window makeKeyAndVisible];
    if (UIDevice.currentDevice.userInterfaceIdiom == UIUserInterfaceIdiomPhone) {
        [QDLaunchHelper startLaunchingAnimationAtWindow:self.window];
    }
}

- (NSUserActivity *)stateRestorationActivityForScene:(UIScene *)scene {
    return scene.userActivity;
}

- (void)sceneDidDisconnect:(UIScene *)scene {
    
    UIWindowSceneDestructionRequestOptions *options = [[UIWindowSceneDestructionRequestOptions alloc] init];

    options.windowDismissalAnimation = UIWindowSceneDismissalAnimationCommit;
    [UIApplication.sharedApplication requestSceneSessionDestruction:scene.session options:options errorHandler:nil];
}
@end
