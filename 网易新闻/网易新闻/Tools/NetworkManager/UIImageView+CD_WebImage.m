//
//  UIImageView+CD_WebImage.m
//  网易新闻
//
//  Created by MacBook on 16/6/16.
//  Copyright © 2016年 MacBook. All rights reserved.
//

#import "UIImageView+CD_WebImage.h"
#import <UIImageView+WebCache.h>
@implementation UIImageView (CD_WebImage)


- (void)cd_setImageWithURLString:(NSString *)urlString {


    //1.转换URL
    NSURL *url = [NSURL URLWithString:urlString];
    
    //2.调用SD设置图像
    if (url != nil) {
        
        [self sd_setImageWithURL:url];
    }


}

@end
