//
//  ZYAppDelegate.m
//  ZYOrderDishes_new
//
//  Created by Stephy_xue on 13-10-28.
//  Copyright (c) 2013年 Stephy_xue. All rights reserved.
//

#import "ZYAppDelegate.h"
#import "ZYDatabaseUitl.h"
#import "ZYViewController.h"

@implementation ZYAppDelegate

- (void)dealloc
{
    [_window release];
    [_viewController release];
    [super dealloc];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    // Override point for customization after application launch.
    [self moveDataBase];
    self.viewController = [[[ZYViewController alloc] initWithNibName:@"ZYViewController" bundle:nil] autorelease];
    self.window.rootViewController = self.viewController;
    [self.window makeKeyAndVisible];
    
    return YES;
}

- (void)moveDataBase
{
    //找到工程文件路径
    
    NSString *file = [[NSBundle mainBundle] pathForResource:@"database" ofType:@"sqlite"];
    
    NSString *toPath = [ZYDatabaseUitl getDataBasePath];
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    NSError *error = nil;
    
    if (![fileManager fileExistsAtPath:toPath]) {
        
        if (![fileManager copyItemAtPath:file toPath:toPath error:&error]) {
            NSLog(@"error == %@",error);
        }else{
            NSLog(@"success");
        }
    }else{
        NSLog(@"已经存在");
    }
    
}


- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
