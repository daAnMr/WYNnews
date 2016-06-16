//
//  WYChannlModel.m
//  网易新闻
//
//  Created by MacBook on 16/6/16.
//  Copyright © 2016年 MacBook. All rights reserved.
//

#import "WYChannlModel.h"

@implementation WYChannlModel

+ (NSArray *)channelList {

    //1.URL
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"topic_news.json" withExtension:nil];
    
    NSData *data = [NSData dataWithContentsOfURL:url];
    
    //2.反序列化
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:0 error:NULL];
    
    //3.从dict中获取数组
    NSArray *array = dict[@"tList"];
    
    //4.字典转模型
    NSArray *modelArray = [NSArray yy_modelArrayWithClass:[self class] json:array];
    
    return modelArray;


}

@end
