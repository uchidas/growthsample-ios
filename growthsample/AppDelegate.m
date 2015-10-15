//
//  AppDelegate.m
//  growthsample
//
//  Created by uchidas on 2015/06/01.
//  Copyright (c) 2015年 Yosuke Uchiyama. All rights reserved.
//

#import "AppDelegate.h"
#import <Growthbeat/GBUrlIntentHandler.h>
#import <Growthbeat/GBNoopIntentHandler.h>
#import "MyCustomIntenHandler.h"
#import "GrowthbeatConstants.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [[Growthbeat sharedInstance] initializeWithApplicationId:GBApplicationId credentialId:GBCredentilaId];
    [[GrowthPush sharedInstance] requestDeviceTokenWithEnvironment:kGrowthPushEnvironment];
    [[GrowthPush sharedInstance] setDeviceTags];
    
    NSMutableArray *intentHandlers = [NSMutableArray array];
    [intentHandlers addObject:[[GBUrlIntentHandler alloc] init]];
    [intentHandlers addObject:[[GBNoopIntentHandler alloc] init]];
    [intentHandlers addObject:[[MyCustomIntenHandler alloc] init]];
    [[GrowthbeatCore sharedInstance] setIntentHandlers:intentHandlers];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    [[Growthbeat sharedInstance] stop];
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    [[Growthbeat sharedInstance] start];
    [[GrowthAnalytics sharedInstance] purchase:100 setCategory:@"energy" setProduct:@"満タンドリンク"];
//    [[GrowthPush sharedInstance] trackEvent:@"Launch"];
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (void) application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {
    [[GrowthPush sharedInstance] setDeviceToken:deviceToken];
}

@end
