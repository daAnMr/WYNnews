//
//  WYMainViewController.m
//  网易新闻
//
//  Created by MacBook on 16/6/15.
//  Copyright © 2016年 MacBook. All rights reserved.
//

#import "WYMainViewController.h"

@interface WYMainViewController ()

@end

@implementation WYMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self addChildViewControllers];
    
}

#pragma mark--添加所有子控制器
- (void)addChildViewControllers {

    NSArray *array = @[
                       @{@"clsName":@"UIViewController",@"title":@"新闻",@"imageName":@"news"},
                       
                       @{@"clsName":@"UIViewController",@"title":@"阅读",@"imageName":@"reader"},
                       
                       @{@"clsName":@"UIViewController",@"title":@"视频",@"imageName":@"media"},
                       
                       @{@"clsName":@"UIViewController",@"title":@"话题",@"imageName":@"bar"},
                       
                       @{@"clsName":@"UIViewController",@"title":@"我",@"imageName":@"me"},
                       ];
    NSMutableArray *arrayM = [NSMutableArray array];
    
    for (NSDictionary *dict in array) {
        
        [arrayM addObject:[self addChildViewControllerWithDict:dict]];
        
    }

    self.viewControllers = arrayM;


}

#pragma mark--添加一个控制器

- (UIViewController *)addChildViewControllerWithDict:(NSDictionary *)dict {

    NSString *clsName = dict[@"clsName"];
    Class cls = NSClassFromString(clsName);
    
    NSAssert(cls != nil, @"类名错误");
    
    UIViewController *vc = [cls new];
    vc.title = dict[@"title"];
    
    NSString *imageName = [NSString stringWithFormat:@"tabbar_icon_%@_normal", dict[@"imageName"]];
    vc.tabBarItem.image = [UIImage imageNamed:imageName];
    
    
    NSString *imageNameHL = [NSString stringWithFormat:@"tabbar_icon_%@_highlight", dict[@"imageName"]];
    vc.tabBarItem.selectedImage = [[UIImage imageNamed:imageNameHL] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];


    return [[UINavigationController alloc] initWithRootViewController:vc];


}
@end
