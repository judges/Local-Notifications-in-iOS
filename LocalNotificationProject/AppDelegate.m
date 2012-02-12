//
//  AppDelegate.m
//  LocalNotificationProject
//
//  Created by Stuart Breckenridge on 12/02/2012.
//  Copyright (c) 2012 __Stuart Breckenridge__. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

@synthesize window = _window;


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    NSLog(@"Application Did Enter Background");
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    NSLog(@"Application Will Enter Foreground");
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    NSLog(@"Application Did Become Active");
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    /*
     Called when the application is about to terminate.
     Save data if appropriate.
     See also applicationDidEnterBackground:.
     */
}

@end
