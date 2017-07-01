//
//  AppDelegate.m
//  Tutorial4May17
//
//  Created by iOS-School-1 on 04.05.17.
//  Copyright © 2017 iOS-School-1. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
   
    UIWindow *window = [UIWindow new];
    UIViewController *startVC = [ViewController new];
    UINavigationController *navigationController = [[UINavigationController alloc]initWithRootViewController:startVC];
    window.rootViewController = navigationController;
    
    self.window = window ;
    [self.window makeKeyAndVisible];
    return YES;
}

@end
