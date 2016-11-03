//
//  AppDelegate.m
//  015-- 原生联网检测
//
//  Created by mac on 16/10/25.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "AppDelegate.h"
#import <Reachability.h>

@interface AppDelegate ()

@property (nonatomic, strong) Reachability *hostReach;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    //开启网络状况的监听
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(reachabilityChanged:) name:kReachabilityChangedNotification object:nil];
    
    self.hostReach = [Reachability reachabilityWithHostName:@"www.baidu.com"] ;
    
    //开始监听，会启动一个run loop
    
    [self.hostReach startNotifier];
    
    return YES;
}

- (void)reachabilityChanged:(NSNotification *)noti {
    
    Reachability *reachability = [noti object];
    
//    if ([reachability isKindOfClass:[reachability class]]) {
//        
//        NSLog(@"%zd", [reachability currentReachabilityStatus]);
//        
//        NetworkStatus status = [reachability currentReachabilityStatus];
//        
//        if (status == NotReachable) {
//            NSLog(@"弹出提示框");
//        } else if (status == ReachableViaWiFi) {
//            NSLog(@"wifi环境，可以放心使用");
//        } else {
//            NSLog(@"蜂窝移动网络，当心流量超额");
//        }
//        
//    }
    
    
    // 或者通过BOOL值直接判断
    if(![reachability isReachable])
    {
        NSLog(@"网络不可用");
        return;
    }
    
    if (reachability.isReachableViaWiFi) {
        NSLog(@"当前通过wifi连接");
        
    } else {
//        NSLog(@"wifi未开启，谨慎使用");
    }
    
    if (reachability.isReachableViaWWAN) {
        NSLog(@"当前通过2g or 3g连接");
    } else {
//        NSLog(@"2g or 3g网络未使用");
    }
    
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
