//
//  AppDelegate.m
//  网易新闻
//
//  Created by MacBook on 16/6/15.
//  Copyright © 2016年 MacBook. All rights reserved.
//

#import "AppDelegate.h"
#import "CZAdditions.h"
#import <AFNetworkActivityIndicatorManager.h>
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    [self setupAppearance];
    
    //设置网络指示器
    [AFNetworkActivityIndicatorManager sharedManager].enabled = YES;
    
    _window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    _window.backgroundColor = [UIColor whiteColor];

    
    Class cls = NSClassFromString(@"WYMainViewController");

    UIViewController *vc = [cls new];
    
    _window.rootViewController = vc;
    [_window makeKeyAndVisible];
    
    
    
    
    return YES;
}

- (void)setupAppearance {

    [UITabBar appearance].tintColor = [UIColor cz_colorWithHex:0xDF0000];

}

@end
