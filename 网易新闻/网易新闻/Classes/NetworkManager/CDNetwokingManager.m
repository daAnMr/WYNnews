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
        
        NSURL *baseURL = [NSURL URLWithString:@"http://c.m.163.com/nc/"];
        
        instance = [[self alloc] initWithBaseURL:baseURL];
    });

    return instance;
}

@end
