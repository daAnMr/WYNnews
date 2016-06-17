//
//  WYChannelLable.m
//  网易新闻
//
//  Created by MacBook on 16/6/17.
//  Copyright © 2016年 MacBook. All rights reserved.
//

#import "WYChannelLable.h"
#define WYNormalSize 14
#define WYSelectedSize 18
@implementation WYChannelLable

+ (instancetype)channelLableWithTitle:(NSString *)title {

    WYChannelLable *l = [self cz_labelWithText:title fontSize:WYSelectedSize color:[UIColor blackColor]];
    l.textAlignment = NSTextAlignmentCenter;
    
    l.font = [UIFont systemFontOfSize:WYNormalSize];
    
    return l;
    



}

@end
