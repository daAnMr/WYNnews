//
//  CDNetwokingManager.h
//  网易新闻
//
//  Created by MacBook on 16/6/15.
//  Copyright © 2016年 MacBook. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>

//网络管理器--统一管理所有网络请求
@interface CDNetwokingManager : AFHTTPSessionManager

+ (instancetype)sharedManager;

//加载新闻列表
- (void)newsListWithCategory:(NSString *)category start:(NSInteger)start completion:(void (^)(NSArray *, NSError *))completion;
@end
