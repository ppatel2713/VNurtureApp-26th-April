//
//  TutorRootViewController.m
//  VNurture App
//
//  Created by Mehul Panchal on 04/04/16.
//  Copyright (c) 2016 Appuno IT Solutions. All rights reserved.
//

#import "TutorRootViewController.h"
#import "TutorHomeViewController.h"
#import "TutorBatchListViewController.h"
#import "TutorBatchDetailViewController.h"

@interface TutorRootViewController ()

@end

@implementation TutorRootViewController

- (void)awakeFromNib
{
    self.menuPreferredStatusBarStyle = UIStatusBarStyleLightContent;
    self.contentViewShadowColor = [UIColor blackColor];
    self.contentViewShadowOffset = CGSizeMake(0, 0);
    self.contentViewShadowOpacity = 0.6;
    self.contentViewShadowRadius = 12;
    self.contentViewShadowEnabled = YES;
    
    self.contentViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"tutorDrawerView"];
    
    UINavigationController *nav = (UINavigationController *) self.contentViewController;
    
    
    TutorHomeViewController *firstVC = [nav.viewControllers firstObject];
    
    [firstVC setSharedTutorHomeViewController:firstVC];
    
    
    
    self.leftMenuViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"TutorMenuListViewController"];
    self.backgroundImage = [UIImage imageNamed:@"Stars@2x"];

    self.delegate = self;
}

#pragma mark -
#pragma mark RESideMenu Delegate

- (void)sideMenu:(RESideMenu *)sideMenu willShowMenuViewController:(UIViewController *)menuViewController
{
    NSLog(@"willShowMenuViewController: %@", NSStringFromClass([menuViewController class]));
}

- (void)sideMenu:(RESideMenu *)sideMenu didShowMenuViewController:(UIViewController *)menuViewController
{
    NSLog(@"didShowMenuViewController: %@", NSStringFromClass([menuViewController class]));
}

- (void)sideMenu:(RESideMenu *)sideMenu willHideMenuViewController:(UIViewController *)menuViewController
{
    NSLog(@"willHideMenuViewController: %@", NSStringFromClass([menuViewController class]));
}

- (void)sideMenu:(RESideMenu *)sideMenu didHideMenuViewController:(UIViewController *)menuViewController
{
    NSLog(@"didHideMenuViewController: %@", NSStringFromClass([menuViewController class]));
}
@end
