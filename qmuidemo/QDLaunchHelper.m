//
//  QDLaunchHelper.m
//  qmuidemo
//
//  Created by king on 2021/4/30.
//  Copyright © 2021 QMUI Team. All rights reserved.
//

#import "QDLaunchHelper.h"

#import "QDComponentsViewController.h"
#import "QDLabViewController.h"
#import "QDNavigationController.h"
#import "QDTabBarViewController.h"
#import "QDUIKitViewController.h"

@implementation QDLaunchHelper
+ (__kindof UIViewController *)generateWindowRootViewController {
    QDTabBarViewController *tabBarViewController = [[QDTabBarViewController alloc] init];

    // QMUIKit
    QDUIKitViewController *uikitViewController   = [[QDUIKitViewController alloc] init];
    uikitViewController.hidesBottomBarWhenPushed = NO;
    QDNavigationController *uikitNavController   = [[QDNavigationController alloc] initWithRootViewController:uikitViewController];
    uikitNavController.tabBarItem                = [QDUIHelper tabBarItemWithTitle:@"QMUIKit" image:UIImageMake(@"icon_tabbar_uikit") selectedImage:UIImageMake(@"icon_tabbar_uikit_selected") tag:0];
    AddAccessibilityHint(uikitNavController.tabBarItem, @"展示一系列对系统原生控件的拓展的能力");

    // UIComponents
    QDComponentsViewController *componentViewController = [[QDComponentsViewController alloc] init];
    componentViewController.hidesBottomBarWhenPushed    = NO;
    QDNavigationController *componentNavController      = [[QDNavigationController alloc] initWithRootViewController:componentViewController];
    componentNavController.tabBarItem                   = [QDUIHelper tabBarItemWithTitle:@"Components" image:UIImageMake(@"icon_tabbar_component") selectedImage:UIImageMake(@"icon_tabbar_component_selected") tag:1];
    AddAccessibilityHint(componentNavController.tabBarItem, @"展示 QMUI 自己的组件库");

    // Lab
    QDLabViewController *labViewController     = [[QDLabViewController alloc] init];
    labViewController.hidesBottomBarWhenPushed = NO;
    QDNavigationController *labNavController   = [[QDNavigationController alloc] initWithRootViewController:labViewController];
    labNavController.tabBarItem                = [QDUIHelper tabBarItemWithTitle:@"Lab" image:UIImageMake(@"icon_tabbar_lab") selectedImage:UIImageMake(@"icon_tabbar_lab_selected") tag:2];
    AddAccessibilityHint(labNavController.tabBarItem, @"集合一些非正式但可能很有用的小功能");

    // window root controller
    tabBarViewController.viewControllers = @[uikitNavController, componentNavController, labNavController];
    return tabBarViewController;
}

+ (void)startLaunchingAnimationAtWindow:(__kindof UIWindow *)window {
    UIView *launchScreenView = [[NSBundle mainBundle] loadNibNamed:@"LaunchScreen" owner:self options:nil].firstObject;
    launchScreenView.frame   = window.bounds;
    [window addSubview:launchScreenView];

    UIImageView *backgroundImageView  = launchScreenView.subviews[0];
    backgroundImageView.clipsToBounds = YES;

    UIImageView *logoImageView = launchScreenView.subviews[1];
    UILabel *copyrightLabel    = launchScreenView.subviews.lastObject;

    UIView *maskView         = [[UIView alloc] initWithFrame:launchScreenView.bounds];
    maskView.backgroundColor = UIColorWhite;
    [launchScreenView insertSubview:maskView belowSubview:backgroundImageView];

    [launchScreenView layoutIfNeeded];

    [launchScreenView.constraints enumerateObjectsUsingBlock:^(__kindof NSLayoutConstraint *_Nonnull obj, NSUInteger idx, BOOL *_Nonnull stop) {
        if ([obj.identifier isEqualToString:@"bottomAlign"]) {
            obj.active = NO;

            [NSLayoutConstraint activateConstraints:@[
                [backgroundImageView.bottomAnchor constraintEqualToAnchor:launchScreenView.topAnchor constant:NavigationContentTop],
            ]];

            *stop = YES;
        }
    }];

    [UIView animateWithDuration:.15 delay:0.9 options:QMUIViewAnimationOptionsCurveOut animations:^{
        [launchScreenView layoutIfNeeded];
        logoImageView.alpha     = 0.0;
        logoImageView.transform = CGAffineTransformMakeScale(3, 3);
        copyrightLabel.alpha    = 0;
    } completion:^(BOOL finished){

    }];

    [UIView animateWithDuration:1.2 delay:0.9 options:UIViewAnimationOptionCurveEaseOut animations:^{
        maskView.alpha            = 0;
        backgroundImageView.alpha = 0;
    } completion:^(BOOL finished) {
        [launchScreenView removeFromSuperview];
    }];
}
@end

