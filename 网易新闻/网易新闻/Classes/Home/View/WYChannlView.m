//
//  WYChannlView.m
//  网易新闻
//
//  Created by MacBook on 16/6/16.
//  Copyright © 2016年 MacBook. All rights reserved.
//

#import "WYChannlView.h"

@implementation WYChannlView

+ (instancetype)channlView {

    UINib *nib = [UINib nibWithNibName:@"WYChannlView" bundle:nil];
    
    return [nib instantiateWithOwner:nil options:nil].lastObject;


}

@end
