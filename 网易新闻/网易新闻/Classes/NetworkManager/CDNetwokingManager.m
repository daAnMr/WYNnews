//
//  CDNetwokingManager.m
//  网易新闻
//
//  Created by MacBook on 16/6/15.
//  Copyright © 2016年 MacBook. All rights reserved.
//

#import "CDNetwokingManager.h"

@implementation CDNetwokingManager

+ (instancetype)sharedManager {

    static CDNetwokingManager *instance;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        NSURL *baseURL = [NSURL URLWithString:@"http://c.m.163.com/nc/article/"];
        
        instance = [[self alloc] initWithBaseURL:baseURL];
        
        instance.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript", @"text/html", nil];
    });

    return instance;
}


#pragma mark--隔离AFN的GET方法
- (void)GETRequest:(NSString *)urlString parameters:(NSDictionary *)parameters completion:(void (^)(id json, NSError *error))completion {
    
    [self GET:urlString parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        completion(responseObject, nil);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"网络请求错误 %@", error);
        
        completion(nil, error);
    }];
}


#pragma mark--新闻数据方法

- (void)newsListWithCategory:(NSString *)category start:(NSInteger)start completion:(void (^)(NSArray *, NSError *))completion {
    
    NSString *urlString = [NSString stringWithFormat:@"list/%@/%zd-20.html", category, start];
    
    [self GETRequest:urlString parameters:nil completion:^(NSDictionary *json, NSError *error) {
        
        // 取得第一个 KEY 中的数组
        NSString *key = json.keyEnumerator.nextObject;
        
        completion(json[key], error);
    }];
}



@end
