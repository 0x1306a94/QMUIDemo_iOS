//
//  QDSceneHelper.m
//  qmuidemo
//
//  Created by king on 2021/4/30.
//  Copyright © 2021 QMUI Team. All rights reserved.
//

#import "QDSceneHelper.h"

NSString *const iPadActivityIdentifier = @"com.tencent.qmui.ipad";

NSString *const iPhoneActivityIdentifier = @"com.tencent.qmui.iphone";

@implementation QDSceneHelper
+ (NSString *)launMainActivityIdentifier {
    switch (UIDevice.currentDevice.userInterfaceIdiom) {
        case UIUserInterfaceIdiomPhone: {
            return iPhoneActivityIdentifier;
        }
        case UIUserInterfaceIdiomPad: {
            return iPadActivityIdentifier;
        }
        default:
            NSCAssert(NO, @"暂不支持");
            break;
    }
    return nil;
}

+ (UISceneConfiguration *)sceneConfiguration:(NSString *)identifier sessionRole:(UISceneSessionRole)sessionRole {
    if (identifier.length == 0) {
        return nil;
    }

    static NSDictionary<NSString *, NSString *> *configurationNames = nil;
    if (configurationNames == nil) {
        configurationNames = @{
            iPhoneActivityIdentifier: @"iPhone",
            iPadActivityIdentifier: @"iPad",
        };
    }
    NSString *name = configurationNames[identifier];
    if (name.length == 0) {
        return nil;
    }

    UISceneConfiguration *configuration = [[UISceneConfiguration alloc] initWithName:name sessionRole:sessionRole];
    return configuration;
}

+ (void)clearHistory {

//    return;
    
    NSArray<UISceneSession *> *openSessions = UIApplication.sharedApplication.openSessions.allObjects;

    NSString *rootIdentifier = [self launMainActivityIdentifier];

    BOOL skip = NO;

    UIWindowSceneDestructionRequestOptions *options = [[UIWindowSceneDestructionRequestOptions alloc] init];

    options.windowDismissalAnimation = UIWindowSceneDismissalAnimationCommit;

    NSLog(@"%@", UIApplication.sharedApplication.connectedScenes);
    for (UISceneSession *session in openSessions) {
        NSLog(@"%@", session.userInfo);
        if ([session.userInfo[@"identifier"] isEqualToString:rootIdentifier] && !skip) {
            // 保留一个
            skip = YES;
        } else {
//            [UIApplication.sharedApplication performSelector:NSSelectorFromString(@"_removeSessionFromSessionSet:") withObject:session];
            [UIApplication.sharedApplication requestSceneSessionDestruction:session options:options errorHandler:nil];
        }
    }
}
@end

