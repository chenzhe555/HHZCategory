//
//  AppDelegate.m
//  HHZCategory
//
//  Created by 陈哲是个好孩子 on 2017/7/15.
//  Copyright © 2017年 陈哲是个好孩子. All rights reserved.
//

#import "AppDelegate.h"
#import "NSDictionary+HHZCategory.h"
#import "NSArray+HHZCategory.h"
#import "NSObject+HHZCategory.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
//    NSArray * arr = @[@"dsadfa",@(12),[UIImage new]];
//    NSDictionary * dic = @{
//                           @"key1":@"dassa",
//                           @"key2":@(33),
//                           @"key3":[UIView new]};
//    NSMutableArray * mArr = [NSMutableArray arrayWithArray:@[@"112"]];
//    NSLog(@"%@\n\n\n\n\n%@",arr[1],nil);
//    NSLog(@"%@\n\n\n\n\n%@",dic,dic.DictionaryValue);
//    NSLog(@"%lu-------\n\n\n",(unsigned long)mArr.count);
//    [mArr addObject:nil];
//    [mArr insertObject:nil atIndex:0];
//    NSLog(@"%@-------\n\n\n",mArr);
    
    NSMutableDictionary * mDic = [NSMutableDictionary dictionary];
    [mDic setObject:@{@"dsd": @"ssssss"} forKey:@"chenzhe"];
    
    NSString * str = [mDic getValueByKeys:@[@"chenzhe",@"dsd",@"ccc"]];
    NSLog(@"....%@",str);

    return YES;
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
