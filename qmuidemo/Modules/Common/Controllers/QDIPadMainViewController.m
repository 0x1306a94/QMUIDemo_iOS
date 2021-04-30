//
//  QDIPadMainViewController.m
//  qmuidemo
//
//  Created by king on 2021/4/30.
//  Copyright © 2021 QMUI Team. All rights reserved.
//

#import "QDIPadMainViewController.h"

#import "QDSceneHelper.h"

@interface QDIPadMainViewController ()

@end

@implementation QDIPadMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (IBAction)openNewWindowAction:(UIButton *)sender {

    //    for (UIScene *scene in UIApplication.sharedApplication.connectedScenes) {
    //        NSString *identifier = scene.session.userInfo[@"identifier"];
    //        if ([identifier isEqualToString:iPhoneActivityIdentifier]) {
    //            [UIApplication.sharedApplication requestSceneSessionActivation:scene.session userActivity:nil options:nil errorHandler:^(NSError *_Nonnull error) {
    //                if (error) {
    //                    NSLog(@"打开已存在窗口失败: %@", error);
    //                }
    //            }];
    //            return;
    //        }
    //    }

    NSUserActivity *activity = [[NSUserActivity alloc] initWithActivityType:iPhoneActivityIdentifier];
    [UIApplication.sharedApplication requestSceneSessionActivation:nil userActivity:activity options:nil errorHandler:^(NSError *_Nonnull error) {
        if (error) {
            NSLog(@"打开新窗口失败: %@", error);
        }
    }];
}

@end

